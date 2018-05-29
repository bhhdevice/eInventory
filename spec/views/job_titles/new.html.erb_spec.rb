require 'rails_helper'

RSpec.describe "job_titles/new", type: :view do
  before(:each) do
    assign(:job_title, JobTitle.new())
  end

  it "renders new job_title form" do
    render

    assert_select "form[action=?][method=?]", job_titles_path, "post" do
    end
  end
end
