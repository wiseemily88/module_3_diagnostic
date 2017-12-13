class NrelService
  attr_reader :get_json

  def initialize(zip_code)
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?format=json&api_key=#{ENV['API_KEY']}&location=#{zip_code}&radius=6.0&fuel_type"
    @get_json = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end
