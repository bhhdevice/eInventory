require 'rails_helper'

RSpec.describe "job_titles/edit", type: :view do
  before(:each) do
    @job_title = assign(:job_title, create(:job_title))
  end

  it "renders the edit job_title form" do
    render

    assert_select "form[action=?][method=?]", job_titles_path, "post" do
    end
  end
end
