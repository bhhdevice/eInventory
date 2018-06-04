require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, create(:location))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do
    end
  end
end
