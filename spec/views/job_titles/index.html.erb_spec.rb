require 'rails_helper'

RSpec.describe "job_titles/index", type: :view do
  before(:each) do
    assign(:job_titles, [
      create(:job_title),
      create(:job_title)
    ])
  end

  it "renders a list of job_titles" do
    render
  end
end
