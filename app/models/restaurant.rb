class Restaurant < ApplicationRecord
  belongs_to :menu

  has_one_attached :file
end
