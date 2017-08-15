class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @booking = Booking.create(user: @user, event: @event)
    redirect_to event_path(@event)
  end
end
