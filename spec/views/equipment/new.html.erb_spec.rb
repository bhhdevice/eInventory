require 'rails_helper'

RSpec.describe "equipment/new", type: :view do
  before(:each) do
    assign(:equipment, Equipment.new())
  end

  it "renders new equipment form" do
    render

    assert_select "form[action=?][method=?]", equipment_index_path, "post" do
      assert_select "select#equipment_brand_id[name=?]", "equipment[brand_id]"
      assert_select "select#equipment_model_id[name=?]", "equipment[model_id]"
      assert_select "input#equipment_asset_tag[name=?]", "equipment[asset_tag]"
      assert_select "input#equipment_hostname[name=?]", "equipment[hostname]"
      assert_select "input#equipment_serial_number[name=?]", "equipment[serial_number]"
      assert_select "input#equipment_phone_number[name=?]", "equipment[phone_number]"
      assert_select "input#equipment_sim_number[name=?]", "equipment[sim_number]"
      assert_select "input#equipment_imei[name=?]", "equipment[imei]"
      assert_select "input#equipment_device_number[name=?]", "equipment[device_number]"
    end
  end
end
