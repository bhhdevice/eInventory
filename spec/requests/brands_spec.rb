require 'rails_helper'

RSpec.describe "Brands", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /brands" do
    it "responded successfully" do
      get brands_path
      expect(response).to have_http_status(200)
    end
  end
end
