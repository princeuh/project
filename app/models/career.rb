class Career < ApplicationRecord
		validates :job_title, presence: true
	validates :department, presence: true
	validates :email, presence: true
	validates :posting, presence: true


end
