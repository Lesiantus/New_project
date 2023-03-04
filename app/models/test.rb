class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integers: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :middle,  -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_categories, ->(name) {
    joins(:category)
      .where(categories: { title: name })
      .order(title: :desc)
      .pluck(:title)
  }
end
