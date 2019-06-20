# frozen_string_literal: true

class UpdateBikesStationsWorker
  include Sidekiq::Worker

  def perform
    Station.new.bikes["network"]["stations"].each do |station|
      BikeStation.create(name: station["name"], free_bikes: station["free_bikes"], latitude: station["latitude"], longitude: station["longitude"]) if BikeStation.where(name: station["name"]).not_exists?
    end
    BikeStation.all.each do |bike_station|
      bike_station.destroy unless Station.new.bikes["network"]["stations"].select { |station| station["name"] == bike_station.name }
    end
  end
end
