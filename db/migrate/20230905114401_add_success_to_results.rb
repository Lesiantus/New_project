class AddSuccessToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :success, :boolean, default: false
  end
end
