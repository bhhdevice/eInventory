require 'rails_helper'

RSpec.describe "Departments", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /departments" do
    it "responded successfully" do
      get '/admin/departments'
      expect(response).to have_http_status(200)
    end
  end
end
