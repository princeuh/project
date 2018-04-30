class Executor < ApplicationRecord
  belongs_to :investor
  validates :primary_firstname, presence: true
  validates :primary_lastname, presence: true
  validates :primary_phone_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :primary_email,  presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :primary_country_of_residence, presence: true
  validates :secondary_firstname, presence: true
  validates :secondary_lastname, presence: true
  validates :secondary_phone_number, presence: true
  validates :secondary_email,  presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :secondary_country_of_residence, presence: true
end
