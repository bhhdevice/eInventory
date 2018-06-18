require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { create(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }

  end

  describe 'associations' do
    it { should have_many(:models) }
  end
end
