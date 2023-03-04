class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  scope :tests_by_level, -> { tests.where(level: level) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 50 }
end
