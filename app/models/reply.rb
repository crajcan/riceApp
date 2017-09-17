class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :asc) } #check this out, maybe need index on created_at
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates(:content, presence: true, 
                      length: { maximum: 1500 })  
end
