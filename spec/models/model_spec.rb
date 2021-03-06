require 'rails_helper'

RSpec.describe Model, type: :model do

  before(:each) do
    @brand = create(:brand)
  end

  describe 'validations' do
    subject { create(:model, brand: @brand) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:category) }
  end

  describe 'associations' do
    it { should belong_to(:brand) }
    it { should belong_to(:category) }
    it { should have_many(:equipment) }
    it { should have_one(:stock) }
  end

  describe '.create_stock' do
    it 'should create an empty stock object' do
      create(:model)
      expect(Model.first.stock).not_to be_nil
    end
  end
end
