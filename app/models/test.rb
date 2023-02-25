class Test < ApplicationRecord
  def self.sort_by_categories(category)
    Test.select(:title).order(title: :desc)
        .joins('JOIN categories ON tests.category_id = categories.id')
        .where("categories.title = :category", category: category)
        .pluck(:title)
  end
end
