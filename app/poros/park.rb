class Park
  attr_reader :id, :name, :description, :directions, :hours

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:fullName]
    @description = hash[:description]
    @directions = hash[:directionsInfo]
    @hours = hours_by_day(hash)

    #
    # .map do |day|
    #   require "pry"; binding.pry
    #   day[0].to_s.capitalize + ": " + day[1]
    # end.join(", ")
  end

  def hours_by_day(hash)
    "Sunday: #{hash[:operatingHours][0][:standardHours][:sunday]}, " +
    "Monday: #{hash[:operatingHours][0][:standardHours][:monday]}, " +
    "Tuesday: #{hash[:operatingHours][0][:standardHours][:tuesday]}, " +
    "Wednesday: #{hash[:operatingHours][0][:standardHours][:wednesday]}, " +
    "Thursday: #{hash[:operatingHours][0][:standardHours][:thursday]}, " +
    "Friday: #{hash[:operatingHours][0][:standardHours][:friday]}, " +
    "Saturday: #{hash[:operatingHours][0][:standardHours][:saturday]}"
  end
end
