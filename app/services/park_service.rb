class ParkService
  def self.get_parks(state_abbreviation)
    response = get_data('https://developer.nps.gov/api/v1/parks').get do |req|
      req.params['stateCode'] = state_abbreviation
      req.params['api_key'] = ENV['parks_api_key']
    end # => Faraday object

    parsed_body = JSON.parse(response.body, symbolize_names: true) # => parsed body with keys as symbols

    parsed_body[:data].map do |result|
      Park.new(result)
    end
  end

  def self.get_data(endpoint)
    Faraday.new(endpoint)
  end
end
