FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
  end
end
