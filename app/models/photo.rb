class Photo < ApplicationRecord
    belongs_to :album, optional: true
    belongs_to :user 
    has_many :like_posts, as: :likepostable

    # validates photo
    validates :title, length: { maximum: 50 }
    validates :description, length: { maximum: 300 }

    # scope photo
    scope :is_public, -> { where(is_public: true) }
    scope :is_private, -> { where(is_public: false) }
end
