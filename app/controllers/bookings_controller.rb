class BookingsController < ApplicationController
before_action :authenticate_user!

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

  def edit
  end

  def update
    @event = Event.find(params[:event_id])
    @booking = Booking.find(params[:id])
    if @booking.update(confirmed: true)
      redirect_to event_path(@event)
    end
  end

end
