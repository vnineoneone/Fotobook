class AddColumnUrlPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :picture, :string
    add_column :albums, :pictures, :json
  end

end
