class User < ApplicationRecord
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy

    has_many :like_posts, dependent: :destroy
    has_many :like_albums, through: :like_posts, source: :likepostable, source_type: "Album"
    has_many :like_photos, through: :like_posts, source: :likepostable, source_type: "Photo"

    has_many :received_follows, class_name: "FollowUser", foreign_key: "followed_id", dependent: :destroy
    has_many :is_followings, class_name: "FollowUser", foreign_key: "follower_id", dependent: :destroy

    has_many :followers, through: :received_follows, source: :follower
    has_many :followings, through: :is_followings, source: :followed

    # validates user
    validates :password, length: { in: 6..20 }
    validates :email, uniqueness: true
    validates :first_name, :last_name, presence: true
    

    # scope user
    scope :is_normal_user, -> { where(is_admin: false) }
    scope :is_admin_user, -> { where(is_admin: true) }

end

