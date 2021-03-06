class Post < ApplicationRecord
  attr_accessor :admin_pinned, :user_pinned

  belongs_to :user
  has_many :replies, dependent: :destroy 
  has_many :pins, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: { maximum: 3000 }
  validates :content, presence: { if: -> { picture.blank? } }
  validates :picture, presence: { if: -> { content.blank? } }
  validate :picture_size

  validates :title, length: { maximum: 100 }
  validates_presence_of :title, :if => :event?

  validates_presence_of :event_time, :if  => :event?

  validates :event_location, length: { maximum: 100 }, :if => :event?
  validates_presence_of :event_location, :if => :event?
 
  #validate the event? if location & time present
end
