require 'rails_helper'

RSpec.describe "Departments", type: :request do

  describe "GET /departments" do
    it "responds to departments path" do
      get '/admin/departments'
      expect(response).to have_http_status(200)
    end
  end
end
