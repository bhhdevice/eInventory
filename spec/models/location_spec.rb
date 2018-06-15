require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    subject { create(:location) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_equal_to 2 }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:phone_number) }
  end

  describe 'associations' do
    it { should have_many(:users) }
  end
end
