class ParkFacade
  def self.parks_fetch(state_abbr)
    json = ParkService.get_parks(state_abbr)

    json[:data].map do |result|
      Park.new(result)
    end
  end
end
