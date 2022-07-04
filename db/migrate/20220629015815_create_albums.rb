class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.references :users, null: false, foreign_key: true
      t.string :tiltle
      t.text :description
      
      t.timestamps
    end
  end
end
