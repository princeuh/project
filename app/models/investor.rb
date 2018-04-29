class Investor < ApplicationRecord
	before_save { email.downcase! }
	validates :firstname, presence: true, length: { maximum: 50 }
	validates :lastname, presence: true
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

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
