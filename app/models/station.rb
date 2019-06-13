# frozen_string_literal: true

class Station
  include HTTParty
  base_uri "api.citybik.es"

  def data
    self.class.get("/v2/networks/velib")
  end

  def bikes
    data.parsed_response
  end
end
