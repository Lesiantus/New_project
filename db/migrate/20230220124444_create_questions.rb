class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, null: false

      t.timestamps
    end
    add_foreign_key :questions, :tests
  end
end
