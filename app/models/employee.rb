class Employee < ApplicationRecord
	before_save { email.downcase! }
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :role, presence: true
	validates :job_category, presence: true
	validates :job_location, presence: true
	validates :reports_to, presence: true
	validates :section, presence: true
	validates :contact_number, presence: true
	validates :employee_pid, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
