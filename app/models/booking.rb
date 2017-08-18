class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates_uniqueness_of :user, :scope => [:event]
  after_create :send_new_booking_email
  after_update :send_confirmation_email
  after_destroy :send_event_cancel_email


  private

  # notifies volunteer once organizer has approved
  def send_confirmation_email
    if self.confirmed == true
      UserMailer.confirmation(self).deliver_now if self.confirmed_changed?
    end
  end

  # notify organizer when someone signs up to an event
  def send_new_booking_email
    UserMailer.new_booking(self).deliver_now
  end

  def send_event_cancel_email
    UserMailer.event_cancel(self).deliver_now
  end

end
