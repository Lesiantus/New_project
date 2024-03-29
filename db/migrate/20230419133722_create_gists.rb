class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.string :gist_url

      t.timestamps
    end
  end
end
