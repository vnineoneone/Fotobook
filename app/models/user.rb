class User < ApplicationRecord
    has_many :photos , dependent: :destroy
    has_many :albums, dependent: :destroy

    has_many :followers, class_name: "FollowUser", foreign_key: "followed_id"
    has_many :followings, class_name: "FollowUser", foreign_key: "follower_id"




   

end
