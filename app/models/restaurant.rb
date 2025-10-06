class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy

  has_one_attached :file
end
