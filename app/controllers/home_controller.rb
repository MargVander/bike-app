# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    thp_location = { "latitude" => 48.872155, "longitude" => 2.346668 }
    @station_with_bikes = BikeStation.where("free_bikes != 0" )
    @closest_bikes_stations = @station_with_bikes.min_by(5) { |x| dist([thp_location["latitude"].to_f, thp_location["longitude"].to_f], [x.latitude, x.longitude]) }
  end

  def dist(loc1, loc2)
    rad_per_deg = Math::PI / 180
    rkm = 6371
    rm = rkm * 1000

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, _lon1_rad = loc1.map { |i| i * rad_per_deg }
    lat2_rad, _lon2_rad = loc2.map { |i| i * rad_per_deg }

    a = Math.sin(dlat_rad / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad / 2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    rm * c
  end
end
