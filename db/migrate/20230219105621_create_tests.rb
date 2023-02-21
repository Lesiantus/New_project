class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, deault: 0
      t.references :category, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_foreign_key :tests, :users
    add_foreign_key :tests, :categories
  end
end
