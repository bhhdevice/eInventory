require 'rails_helper'

RSpec.describe Stock, type: :model do
  # * inventory stock is created right after a corresponding brand or model is created *
  before(:each) do
    @brand = create(:brand)
    @model = create(:model, brand: @brand)
    3.times do
      create(:equipment, brand: @brand, model: @model)
    end
  end

  describe 'validations' do
    subject { create(:stock) }

    it { should validate_presence_of(:item).with_message("must exist") }
  end

  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:category) }
  end

  describe '.update' do
    context 'changes total, available, & in-use inventory to present values' do
      it 'total equals the number of item equipment' do
        expect(@brand.stock.total).to eq 3
        expect(@model.stock.total).to eq 3
      end
      it 'available equals total minus in-use' do
        expect(@brand.stock.available).to eq 3
        expect(@model.stock.available).to eq 3
      end
      it 'in-use equals number of item assignments' do
        expect(@brand.stock.in_use).to eq 0
        expect(@model.stock.in_use).to eq 0
      end
    end
  end
end
