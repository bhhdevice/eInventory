require 'rails_helper'

RSpec.describe "brands/edit", type: :view do
  before(:each) do
    @brand = assign(:brand, create(:brand))
  end

  it "renders the edit brand form" do
    render

    assert_select "form[action=?][method=?]", brand_path(@brand), "post" do
      assert_select "input#brand_name[name=?]", "brand[name]"
      assert_select "input#brand_address[name=?]", "brand[address]"
      assert_select "input#brand_city[name=?]", "brand[city]"
      assert_select "input#brand_state[name=?]", "brand[state]"
      assert_select "input#brand_zip_code[name=?]", "brand[zip_code]"
      assert_select "input#brand_phone_number[name=?]", "brand[phone_number]"
      assert_select "input#brand_website[name=?]", "brand[website]"
    end
  end
end
