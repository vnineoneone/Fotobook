class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :is_public, default: false

      t.timestamps
    end
  end
end
