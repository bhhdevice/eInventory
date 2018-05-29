require 'rails_helper'

RSpec.describe "job_titles/edit", type: :view do
  before(:each) do
    @job_title = assign(:job_title, JobTitle.create!())
  end

  it "renders the edit job_title form" do
    render

    assert_select "form[action=?][method=?]", job_title_path(@job_title), "post" do
    end
  end
end
