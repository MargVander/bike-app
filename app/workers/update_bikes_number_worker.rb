# frozen_string_literal: true

class UpdateBikesNumberWorker
  include Sidekiq::Worker

  def perform
    Station.new.bikes["network"]["stations"].each do |station|
      BikeStation.where(name: station["name"]).update(free_bikes: station["free_bikes"]) if BikeStation.where(name: station["name"]).exists?
    end
  end
end
