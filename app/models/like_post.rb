class LikePost < ApplicationRecord
    belongs_to :post, polymorphic: true
    
end
