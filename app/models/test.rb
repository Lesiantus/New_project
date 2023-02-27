class Test < ApplicationRecord
  def self.sort_by_categories(name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desc)
      .pluck(:title)
  end
end
