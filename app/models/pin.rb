class Pin < ApplicationRecord
 
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :post }
  belongs_to :user
  belongs_to :post
end
