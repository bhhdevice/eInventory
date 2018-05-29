require 'rails_helper'

RSpec.describe "job_titles/index", type: :view do
  before(:each) do
    assign(:job_titles, [
      JobTitle.create!(),
      JobTitle.create!()
    ])
  end

  it "renders a list of job_titles" do
    render
  end
end
