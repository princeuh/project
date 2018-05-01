class Contact < ApplicationRecord
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :email, presence: true
	validates :subject, presence: true
	validates :inquiry, presence: true

end
