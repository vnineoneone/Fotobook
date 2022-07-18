class Album < ApplicationRecord
    belongs_to :user
    has_many :photos
    has_many :like_posts, as: :likepostable, dependent: :destroy

    # validates album
    validates :title, length: { maximum: 140 }, presence: true
    validates :description, length: { maximum: 300 }, presence: true
    validates :is_public, inclusion: [true, false]

    # scope album
    scope :is_public, -> { where(is_public: true) }
    scope :is_private, -> { where(is_public: false) }


end