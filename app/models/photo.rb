class Photo < ApplicationRecord
    belongs_to :album, optional: true
    belongs_to :user 
    has_many :like_posts, as: :likepostable, dependent: :destroy

    # validates photo
    validates :title, length: { maximum: 140 }, presence: true
    validates :description, length: { maximum: 300 }, presence: true
    validates :is_public, inclusion: [true, false]

    # scope photo
    scope :is_public, -> { where(is_public: true) }
    scope :is_private, -> { where(is_public: false) }
    
end
