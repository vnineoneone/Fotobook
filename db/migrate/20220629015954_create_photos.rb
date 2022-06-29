class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :users, null: false, foreign_key: true
      t.references :albums, null: false, foreign_key: true
      t.string :tiltle
      t.text :description

      t.timestamps
    end
  end
end
