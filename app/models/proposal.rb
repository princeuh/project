class Proposal < ApplicationRecord
  belongs_to :investor
  validates :title, presence: true
  validates :content, presence: true
  validates :country, presence: true
  validates :target_amt, presence: true
end
