class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
   
  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }, allow_nil: true 
  validates :name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, 
                    length: {maximum: 255}, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false })
 
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "unfollower_id",
                                   dependent:   :destroy
  has_many :unfollowing, through: :active_relationships, source: :unfollowed
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "unfollowed_id",
                                   dependent:   :destroy
  has_many :unfollowers, through: :passive_relationships, source: :unfollower

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def feed
=begin
    unfollowing_ids = "SELECT unfollowed_id FROM relationships
                       WHERE  unfollower_id = :user_id"
    Post.where("user_id NOT_IN (#{unfollowing_ids})
                OR user_id = :user_id", user_id: id)
=end
    Post.where("user_id = ?", id) 
  end

  def unfollow(other_user)
    unfollowing << other_user
  end

  def follow(other_user)
    unfollowing.delete(other_user)
  end

  def following?(other_user)
    !unfollowing.include?(other_user)
  end

  private
  
    def create_activation_digest
      self.activation_token =  User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
