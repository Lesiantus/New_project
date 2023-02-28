class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.sort_by_categories(name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desc)
      .pluck(:title)
  end
end
