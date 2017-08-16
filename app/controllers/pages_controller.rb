class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def profile
    @events = Event.all
  end
end
