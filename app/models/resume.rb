class Resume < ApplicationRecord
	belongs_to :career
	attr_accessor :reset_token
	before_create :assign_user_type
	mount_uploader :attachment, AttachmentUploader
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :bioSketch, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	validates :email,  presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password 
	validates :password, presence: true, length: { minimum: 6 }

def Resume.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

   def Beneficiary.new_token
    SecureRandom.urlsafe_base64
  end

   def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end


   def assign_user_type
      self.user_type = "resume"
  end

   def create_reset_digest
    self.reset_token = Resume.new_token
    update_attribute(:reset_digest,  Resume.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
   NemabollonMailer.password_reset(self).deliver_now
  end
end
