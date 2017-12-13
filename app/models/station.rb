class Station

  attr_reader :name, :address, :fuel_type, :distance, :access_time

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_time = attrs[:access_days_time]
  end

  def self.find_by_zip(zip_code)
    NrelService.new(zip_code).get_json.map do |raw_data|
      Station.new(raw_data)
    end
  end

end
