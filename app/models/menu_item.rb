class MenuItem < ApplicationRecord
  has_many :menu_menu_item, dependent: :destroy
  has_many :menus, through: :menu_menu_item

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

end
