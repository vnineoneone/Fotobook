class AddColumnUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :picture, :string
    add_column :users, :active, :boolean
  end
end
