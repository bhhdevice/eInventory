require 'rails_helper'

RSpec.describe Equipment, type: :model do
  before(:each) do
    @brand = create(:brand)
    @model = create(:model, brand: @brand)
  end

  describe 'validations' do
    subject { create(:equipment, brand: @brand, model: @model) }

    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:model) }
  end

  describe 'associations' do
    it { should belong_to(:brand) }
    it { should belong_to(:model) }
  end
end
