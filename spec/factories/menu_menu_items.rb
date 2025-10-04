FactoryBot.define do
  factory :menu_menu_item do
    menu { create(menu) }
    menu_item { create(menu_item) }
    total_price { Faker::Number.decimal(l_digits: 2) }
  end
end
