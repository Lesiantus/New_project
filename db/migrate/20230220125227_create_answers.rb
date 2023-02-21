class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false, null: false
      t.references :questions, null: false

      t.timestamps
    end
    add_foreign_key :answers, :questions
  end
end
