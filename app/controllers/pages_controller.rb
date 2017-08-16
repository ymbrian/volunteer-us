class PagesController < ApplicationController
  def home
    @events = Event.all
    @featured_events = @events.order('date DESC').limit(3)
  end

  def profile
    @events = Event.all
  end
end
