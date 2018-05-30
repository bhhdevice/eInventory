require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'validations' do
    subject { create(:department) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cost_center) }
    it { should validate_length_of(:cost_center).is_equal_to 4 }
  end

  describe 'associations' do
    it { should have_many(:users) }
  end
end
