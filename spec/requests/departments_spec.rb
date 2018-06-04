require 'rails_helper'

RSpec.describe "Departments", type: :request do

  describe "GET /departments" do
    it "responds to departments path" do
      get '/departments'
      expect(response).to be_successful
    end
  end
end
