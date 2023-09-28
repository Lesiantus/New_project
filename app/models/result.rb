class Result < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question, on: %i[create update]

  def completed?
    time_over? || current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save!
  end

  def successfull?
    success_count >= SUCCESS_RATIO
  end

  def success!
    update(success: true) if successfull?
  end

  def success_count
    100 / test.questions.count * correct_question
  end

  def progress
    (((current_question_number - 1).to_f / total_questions) * 100).to_i
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  def remaining_seconds
    ((created_at + test.timer.minutes) - Time.current).to_i
  end

  def time_over?
    test.timer && Time.now > end_time
  end

  def end_time
    created_at + test.timer.minutes
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
