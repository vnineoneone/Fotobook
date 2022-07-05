class LikePost < ApplicationRecord
    belongs_to :post, polymorphic: true
    belongs_to :user
end
