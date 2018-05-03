class Beneficiary < ApplicationRecord
	attr_accessor :remember_token
	 before_save { email.downcase! }
	 validates :firstname, presence: true, length: { maximum: 50 }
	 validates :lastname, presence: true, length: { maximum: 50 }
	 validates :address, presence: true
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
end
