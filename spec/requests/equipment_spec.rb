require 'rails_helper'

RSpec.describe "Equipment", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /equipment" do
    it "responded successfully." do
      get equipment_index_path
      expect(response).to have_http_status(200)
    end
  end
end
