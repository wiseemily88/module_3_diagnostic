class SearchController < ApplicationController

  def index

    response = Faraday.get 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?format=json&api_key=nNyQewlqUIYl6CmQdPRTDzcjhYkl9AaUR6Ar5rZ3&location=80203&radius=6.0&fuel_type'
    get_json= JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    get_json.map do |raw_data|
      Station.new(raw_data)
    end

    @stations = Station.10_by_zip(params[:q])
  end

end
