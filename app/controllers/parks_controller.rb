class ParksController < ApplicationController
  def index
    @parks = ParkService.get_parks(params[:state])
  end
end
