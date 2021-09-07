class Park
  attr_reader :id, :name, :description, :directions, :hours

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:fullName]
    @description = hash[:description]
    @directions = hash[:directionsInfo]
    # require "pry"; binding.pry
    @hours = hash[:operatingHours].first[:standardHours] # => i.e. {day: "times", etc.}
  end
end
