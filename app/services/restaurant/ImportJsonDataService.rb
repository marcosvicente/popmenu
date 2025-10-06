class Restaurant::ImportJsonDataService
  def initialize(file)
    @file = file
    @restaurant_record = nil
  end
  def call
    read_json_file
    create_data
    @restaurant_record
  end

  private
  def read_json_file
    json_string = File.read(@file.path)
  end

  def parse_json
    JSON.parse(read_json_file)
  end

  def create_data
    ActiveRecord::Base.transaction do
      parse_json["restaurants"].each do |restaurant|
        @restaurant_record = Restaurant.create(name: restaurant["name"])
        restaurant["menus"].each_with_index do |menu|

          menu_record = Menu.create(name: menu["name"], restaurant_id: @restaurant_record.id)

          next if menu["menu_items"].nil?
          menu["menu_items"].each do |menu_item|
            menu_item_record = MenuItem.create(name: menu_item["name"], price: menu_item["price"])
            MenuMenuItem.create(menu_id: menu_record.id, menu_item_id: menu_item_record)
          end
        end
      end
    end
  end
end