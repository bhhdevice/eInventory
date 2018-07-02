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

  describe '.model_brand_ok?' do
    it 'returns false when model is not within selected brand' do
      equipment = build(:equipment, brand: @brand, model: create(:model))
      expect(equipment.send(:model_brand_ok?)).to eq false
    end
  end

  describe '.category' do
    it 'returns equipment model category' do
      equipment = create(:equipment, brand: @brand, model: @model)
      expect(equipment.category).to eq equipment.model.category
    end

    it 'returns nil when a model does not exist' do
      equipment = build(:equipment, brand: @brand, model: nil)
      expect(equipment.category).to eq nil
    end
  end
end
