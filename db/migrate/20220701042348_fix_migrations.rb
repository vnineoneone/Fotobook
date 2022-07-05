class FixMigrations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :albums, :user_id, false
    change_column_null :photos, :user_id, false

    remove_reference :like_posts, :album, foreign_key: true
    remove_reference :like_posts, :photo, foreign_key: true
    add_reference :like_posts, :post, polymorphic: true, null: false

    add_column :albums, :is_public, :boolean, default: false
    add_column :photos, :is_public, :boolean, default: false

    change_column_default(:users, :is_admin,from: nil, to: false)
  end
end
