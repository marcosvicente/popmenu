require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  subject(:menu_item) { build(:menu_item) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
end
