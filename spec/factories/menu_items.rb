FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Restaurant.description  }
  end
end
