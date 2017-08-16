class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def profile
  end
end
