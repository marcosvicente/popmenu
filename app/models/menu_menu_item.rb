class MenuMenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :menu_item

  validates :total_price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }

end
