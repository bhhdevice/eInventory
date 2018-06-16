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
    it { should_not allow_value('acbd').for(:zip_code)}
    it { should_not allow_value('1234').for(:zip_code)}
    it { should allow_value('01234').for(:zip_code)}
    it { should allow_value('01234-1234').for(:zip_code)}
    it { should validate_presence_of(:phone_number) }
    it { should_not allow_value('acbd').for(:phone_number)}
    it { should_not allow_value('1234').for(:phone_number)}
    it { should_not allow_value('0123456789').for(:phone_number)}
    it { should allow_value('123-123-1234').for(:phone_number)}
    it { should allow_value('1-123-123-1234').for(:phone_number)}
  end

  describe 'associations' do
    it { should have_many(:users) }
  end
end
