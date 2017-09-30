class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  default_scope -> { order(:created_at) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, length: { maximum: 1500 }
  validates :content, presence: { if: -> { picture.blank? } }
  validates :picture, presence: { if: -> { content.blank? } }
  validate :picture_size

end
