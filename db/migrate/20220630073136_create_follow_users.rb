class CreateFollowUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_users, primary_key: [:follower_id, :followed_id] do |t|
      t.references :follower, index: true, foreign_key: {to_table: :users}
      t.references :followed, index: true, foreign_key: {to_table: :users}

      
      t.timestamps
    end
  end
end
