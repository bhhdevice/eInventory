require 'rails_helper'

RSpec.describe "Locations", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /locations" do
    it "responded successfully" do
      get locations_path
      expect(response).to have_http_status(200)
    end
  end
end
