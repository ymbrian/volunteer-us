class Event < ApplicationRecord
  belongs_to :user
  validates :title, :date, :location, :category, presence: true
end
