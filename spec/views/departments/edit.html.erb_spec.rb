require 'rails_helper'

RSpec.describe "departments/edit", type: :view do
  before(:each) do
    @department = assign(:department, create(:department))
  end

  it "renders the edit department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do
    end
  end
end
