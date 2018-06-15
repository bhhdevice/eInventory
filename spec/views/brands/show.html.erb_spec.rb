require 'rails_helper'

RSpec.describe "brands/show", type: :view do
  before(:each) do
    @brand = assign(:brand, create(:brand))
  end

  it "renders attributes in <p>" do
    render
  end
end
