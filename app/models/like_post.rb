class LikePost < ApplicationRecord
    belongs_to :likepostable, polymorphic: true
    belongs_to :user

    
end
