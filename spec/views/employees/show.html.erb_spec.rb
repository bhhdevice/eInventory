require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, create(:employee))
  end

  it "renders attributes in <p>" do
    render
  end
end
