class ParksController < ApplicationController
  def index
    @parks = ParkService.get_parks(params[:state])
  end

  # private
  # def _params
  #   params.permit(:)
  # end
end
