require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, create(:category))
  end

  it "renders attributes in <p>" do
    render
  end
end
