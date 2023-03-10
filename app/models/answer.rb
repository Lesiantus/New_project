class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question_id, 'There can be only 4 answers for a single question') if question.answers.count >= 4
  end
end
