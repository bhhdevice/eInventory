require 'rails_helper'

RSpec.describe Status, type: :model do
  describe 'validations' do
    subject { create(:status) }

    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:employees) }
  end
end
