# frozen_string_literal: true

class CreateBikeStations < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_stations do |t|
      t.string :name
      t.integer :free_bikes
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
