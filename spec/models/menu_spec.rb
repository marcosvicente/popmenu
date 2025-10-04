require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject(:menu) { build(:menu) }

  it { is_expected.to validate_presence_of(:name) }
end
