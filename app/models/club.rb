class Club < ApplicationRecord
	  validates :name, presence: true
  validates :focus_country, presence: true
  validates :country_manager, presence: true
  validates :fund_target, presence: true
  validates :amt_invested, presence: true
  validates :number_of_members, presence: true
	
end
