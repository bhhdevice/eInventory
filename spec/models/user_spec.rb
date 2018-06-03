require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { create(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:job_title) }
    it { should validate_presence_of(:employee_number) }
    it { should validate_length_of(:employee_number).is_equal_to 7 }
    it { should validate_presence_of(:department) }
    it { should validate_presence_of(:location) }
    it { should allow_value(nil).for(:address) }
    it { should allow_value(nil).for(:state) }
    it { should validate_length_of(:state).is_equal_to 2 }
    it { should allow_value(nil).for(:city) }
    it { should allow_value(nil).for(:zip_code) }

    it { should allow_value(nil).for(:phone_number) }
  end

  describe 'associations' do
    it { should belong_to(:department) }
    it { should belong_to(:location) }
    it { should belong_to(:job_title) }
  end
end
