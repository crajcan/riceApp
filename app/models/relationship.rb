class Relationship < ApplicationRecord

  validates :unfollower_id, presence: true
  validates :unfollowed_id, presence: true

  belongs_to :unfollower, class_name: "User"
  belongs_to :unfollowed, class_name: "User"
end
