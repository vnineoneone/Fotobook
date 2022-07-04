class Album < ApplicationRecord
    belongs_to :user
    has_many :photos , dependent: :destroy
    has_many :like_post, as: :post
end
