class ParkService
  def self.get_parks(state_abbr)
    response = get_data('https://developer.nps.gov/api/v1/parks').get do |req|
      req.params['stateCode'] = state_abbr
      req.params['api_key'] = ENV['parks_api_key']
    end # => Faraday object

    JSON.parse(response.body, symbolize_names: true) # => parsed body with keys as symbols
  end

  def self.get_data(endpoint)
    Faraday.new(endpoint)
  end
end
