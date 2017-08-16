class Event < ApplicationRecord
  CATEGORY = ["startup", "healthcare", "education", "sports"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :location, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
