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
    it { should_not allow_value('acbd').for(:zip_code)}
    it { should_not allow_value('1234').for(:zip_code)}
    it { should allow_value('01234').for(:zip_code)}
    it { should allow_value('01234-1234').for(:zip_code)}
    it { should allow_value(nil).for(:phone_number) }
    it { should_not allow_value('acbd').for(:phone_number)}
    it { should_not allow_value('1234').for(:phone_number)}
    it { should_not allow_value('0123456789').for(:phone_number)}
    it { should allow_value('123-123-1234').for(:phone_number)}
    it { should allow_value('1-123-123-1234').for(:phone_number)}
  end

  describe 'associations' do
    it { should belong_to(:department) }
    it { should belong_to(:location) }
    it { should belong_to(:job_title) }
    it { should belong_to(:status) }
    it { should belong_to(:reports_to) }
  end
end
