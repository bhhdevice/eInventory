require 'rails_helper'

RSpec.describe "JobTitles", type: :request do

  before(:each) do
    request_login_admin
  end

  describe "GET /job_titles" do
    it "responded successfully" do
      get job_titles_path
      expect(response).to have_http_status(200)
    end
  end
end
