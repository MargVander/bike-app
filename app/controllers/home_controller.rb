# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    thp_location = { "latitude" => 48.872155, "longitude" => 2.346668 }
    @station_with_bikes = Station.new.bikes["network"]["stations"].select { |station| station["free_bikes"].positive? }
    @closest_bikes_stations = @station_with_bikes.min_by(5) { |x| (x["latitude"].to_f - thp_location["latitude"]).abs + (x["longitude"].to_f - thp_location["longitude"]).abs }
    # render json: @bikes
    # xs.min_by { |x| (x.to_f - 82.4).abs }
  end
end
