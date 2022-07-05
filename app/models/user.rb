class User < ApplicationRecord
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy

    has_many :like_posts
    has_many :like_albums, through: :like_posts, source: :post, source_type: "Album"
    has_many :like_photos, through: :like_posts, source: :post, source_type: "Photo"

    has_many :received_follows, class_name: "FollowUser", foreign_key: "followed_id"
    has_many :is_followings, class_name: "FollowUser", foreign_key: "follower_id"

    has_many :followers, through: :received_follows, source: :follower
    has_many :followings, through: :is_followings, source: :followed

    
end
