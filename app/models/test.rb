class Test < ApplicationRecord
  def self.sort_by_categories(category)
    joins(:categories).where(categories: { title: category }).order('tests.title DESC').pluck(:title)
  end
end
