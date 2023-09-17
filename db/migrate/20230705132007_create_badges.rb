class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :rule, null: false
      t.text :image_name, null: false
      t.integer :level
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
