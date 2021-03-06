require 'rails_helper'

RSpec.describe "job_titles/edit", type: :view do
  before(:each) do
    @job_title = assign(:job_title, create(:job_title))
  end

  it "renders the edit job_title form" do
    render

    assert_select "form[action=?][method=?]", job_title_path(@job_title), "post" do
      assert_select "input#job_title_name[name=?]", "job_title[name]"
    end
  end
end
