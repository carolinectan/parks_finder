class ParksController < ApplicationController
  def index
    @parks = ParkFacade.parks_fetch(params[:state])
  end
end
