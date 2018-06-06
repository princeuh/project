class Career < ApplicationRecord
	has_many :resumes, dependent: :destroy
	validates :job_title, presence: true
	validates :department, presence: true
	validates :email, presence: true
	validates :posting, presence: true


end
