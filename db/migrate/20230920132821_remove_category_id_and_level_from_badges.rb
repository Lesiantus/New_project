class RemoveCategoryIdAndLevelFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :category_id
    remove_column :badges, :level, :integer
  end
end
