class ImportJsonJob < ApplicationJob
  queue_as :default

  def perform(file)
    restaurant = Restaurant::ImportJsonDataService.new(file).call
    restaurant
  end
end
