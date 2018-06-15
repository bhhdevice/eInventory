require 'rails_helper'

RSpec.describe "brands/new", type: :view do
  before(:each) do
    assign(:brand, Brand.new())
  end

  it "renders new brand form" do
    render

    assert_select "form[action=?][method=?]", brands_path, "post" do
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
