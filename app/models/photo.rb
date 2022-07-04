class Photo < ApplicationRecord
    belongs_to :album, optional: true
    belongs_to :user 
    has_many :like_post, as: :post
end
