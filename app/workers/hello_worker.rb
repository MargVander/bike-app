# frozen_string_literal: true

class HelloWorker
  include Sidekiq::Worker

  def perform
    puts 'Hello world'
  end
end
