class CreateLikePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :like_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :likepostable, polymorphic: true, null: false
      
      t.timestamps
    end
  end
end
