# frozen_string_literal: true

Station.new.bikes["network"]["stations"].each do |station|
  BikeStation.create(name: station["name"], free_bikes: station["free_bikes"], latitude: station["latitude"], longitude: station["longitude"])
end
