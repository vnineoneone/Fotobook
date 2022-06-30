class CreateLikePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :like_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
