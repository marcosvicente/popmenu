class MenuMenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :menu_item

  validates :total_price, presence: true, numericality: { greater_than: 0 }
end
