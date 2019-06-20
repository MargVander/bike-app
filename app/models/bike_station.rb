# frozen_string_literal: true

# == Schema Information
#
# Table name: bike_stations
#
#  id         :bigint           not null, primary key
#  free_bikes :integer
#  latitude   :float
#  longitude  :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BikeStation < ApplicationRecord
end
