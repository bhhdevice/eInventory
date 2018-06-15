require 'rails_helper'

RSpec.describe "brands/index", type: :view do
  before(:each) do
    assign(:brands, [
      create(:brand),
      create(:brand)
    ])
  end

  it "renders a list of brands" do
    render
  end
end
