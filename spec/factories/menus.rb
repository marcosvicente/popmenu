FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    restaurant { create(:restaurant)}
  end
end
