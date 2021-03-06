require 'rails_helper'

RSpec.describe "Models", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /models" do
    it "responded successfully" do
      get models_path
      expect(response).to have_http_status(200)
    end
  end
end
