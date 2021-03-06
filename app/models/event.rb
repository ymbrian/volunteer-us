 class Event < ApplicationRecord
  CATEGORY = ["startup", "healthcare", "education", "sports"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :location, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }
  geocoded_by :location
  after_validation :geocode, if: :location_changed?


  # These params are attachments passed through the Event creation form
  # These images will be used to fill the background of the cards on the Events
  # index page
  has_attachment :poster
  has_attachments :images

  after_update :send_event_update_email


  private

  def send_event_update_email
    self.bookings.each do |booking|
      UserMailer.event_update(booking).deliver_now
    end
  end
end
