class Beneficiary < ApplicationRecord
	attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest, :assign_user_type
	 before_save { email.downcase! }
	 validates :firstname, presence: true, length: { maximum: 50 }
	 validates :lastname, presence: true, length: { maximum: 50 }
	 validates :address, presence: true
   validates :enterprise_name, presence: true
	 validates :city, presence: true
	 validates :country, presence: true
	 validates :phone_number, presence: true
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
		validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

  def Beneficiary.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Beneficiary.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Beneficiary.new_token
    update_attribute(:remember_digest, Beneficiary.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget_beneficiary
    update_attribute(:remember_digest, nil)
  end

   def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end


  def create_activation_digest
      self.activation_token  = Beneficiary.new_token
      self.activation_digest = Beneficiary.digest(activation_token)
  end

    def create_reset_digest
    self.reset_token = Beneficiary.new_token
    update_attribute(:reset_digest,  Beneficiary.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
     NemabollonMailer.password_reset(self).deliver_now
  end

  def assign_user_type
      self.user_type = "beneficiary"
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def send_activation_email
    NemabollonMailer.account_activation(self).deliver_now
  end

  def activate
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
  end


end
