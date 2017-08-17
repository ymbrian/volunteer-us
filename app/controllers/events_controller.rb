class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @events_map = Event.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@events_map) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.title
    end
  end

  def show
    if user_signed_in?
      @user_check = @event.bookings.where("user_id = ?", current_user.id)
    end
    @event = Event.find(params[:id])
    @event_coordinates = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow @event.title
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    # These params are required to create an event in event/new view
    params.require(:event).permit(:title, :date, :location, :category, :poster, images: [])
  end
end
