FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    menu { create(:menu) }
  end
end
