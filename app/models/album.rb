class Album < ApplicationRecord
    belongs_to :user
    has_many :photos , dependent: :destroy
    has_many :like_posts, as: :likepostable

    # validates album
    validates :title, length: { maximum: 50 }
    validates :description, length: { maximum: 300 }

    # scope album
    scope :is_public, -> { where(is_public: true) }
    scope :is_private, -> { where(is_public: false) }

end