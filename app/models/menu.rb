class Menu < ApplicationRecord
  has_many :menu_menu_item, dependent: :destroy
  has_many :menu_items, through: :menu_menu_item

  validates :name, presence: true
end
