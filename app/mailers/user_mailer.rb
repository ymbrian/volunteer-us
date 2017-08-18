class UserMailer < ApplicationMailer
  default from: 'volunteer-us@test.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.user_mailer.welcome.subject
  #
  layout 'mailer'

  # email to volunteer to notify confirmation
  def confirmation(booking)
    @booking = booking
    mail(to: booking.user.email, subject: "You have been confirmed!")
  end

  # notify organizer when someone signs up for an event
  def new_booking(booking)
    @booking = booking
    mail(to: booking.event.user.email, subject: "#{booking.user.first_name} has signed up for #{booking.event.title}!")
  end

  # notify all volunteers if event has been updated
  def event_update(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: "#{@booking.event.title} details have been updated")
  end

  # notify all volunteers if event has been deleted
  def event_cancel(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: "#{@booking.event.title} has been cancelled")
  end

  # send email upon new user sign up (REPLACED BY CONFIRMATION EMAIL)
  #
  # def welcome(user)
  #   @user = user
  #   mail(to: @user.email, subject: "Welcome to VolunteerUs")
  #   # Renders a view in `app/views/user_mailer`!
  # end

end
