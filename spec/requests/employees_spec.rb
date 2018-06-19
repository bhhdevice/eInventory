require 'rails_helper'

RSpec.describe "Employees", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /employees" do
    it "responded successfully" do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end
end
