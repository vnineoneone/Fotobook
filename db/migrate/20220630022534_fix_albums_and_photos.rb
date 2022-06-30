class FixAlbumsAndPhotos < ActiveRecord::Migration[7.0]
  def change
    # fix foreign_key users -> user
    remove_reference :albums, :users, foreign_key: true
    add_reference :albums, :user, foreign_key: true

    remove_reference :photos, :users, foreign_key: true
    add_reference :photos, :user, foreign_key: true

    remove_reference :photos, :albums, foreign_key: true
    add_reference :photos, :album, foreign_key: true
    
    # # fix tiltle -> title
    rename_column :photos, :tiltle, :title
    rename_column :albums, :tiltle, :title

  end
end
