class Investor < ApplicationRecord
	before_save { email.downcase! }
  attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest, :assign_user_type
  has_many :executors, dependent: :destroy
  has_many :proposals, dependent: :destroy
	validates :firstname, presence: true, length: { maximum: 50 }
	validates :lastname, presence: true
  validates :investment_total, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

     


  def Investor.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
   	  BCrypt::Password.create(string, cost: cost)
  end

  def Investor.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Investor.new_token
    update_attribute(:remember_digest, Investor.digest(remember_token))
  end

   def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end


  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


  def activate
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
  end

  # Sends activation email.
  def send_activation_email
    NemabollonMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = Investor.new_token
    update_attribute(:reset_digest,  Investor.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
   NemabollonMailer.password_reset(self).deliver_now
  end

  private
    def create_activation_digest
      self.activation_token  = Investor.new_token
      self.activation_digest = Investor.digest(activation_token)
    end

    def assign_user_type
      self.user_type = "investor"
  end

end
