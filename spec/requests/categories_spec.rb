require 'rails_helper'

RSpec.describe "Categories", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /categories" do
    it "responded successfully" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end
end
