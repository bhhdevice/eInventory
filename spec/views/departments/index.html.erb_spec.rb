require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      create(:department),
      create(:department)
    ])
  end

  it "renders a list of departments" do
    render
  end
end
