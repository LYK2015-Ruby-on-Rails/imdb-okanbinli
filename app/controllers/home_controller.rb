class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @ratings = RatingCache.order("avg DESC")
  end
end
