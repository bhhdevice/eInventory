require 'rails_helper'

RSpec.describe "models/new", type: :view do
  before(:each) do
    assign(:model, Model.new())
  end

  it "renders new model form" do
    render

    assert_select "form[action=?][method=?]", models_path, "post" do
      assert_select "input#model_name[name=?]", "model[name]"
      assert_select "select#model_brand_id[name=?]", "model[brand_id]"
      assert_select "select#model_category_id[name=?]", "model[category_id]"
      assert_select "select#model_release_date_1i[name=?]", "model[release_date(1i)]"
      assert_select "select#model_release_date_2i[name=?]", "model[release_date(2i)]"
      assert_select "select#model_release_date_3i[name=?]", "model[release_date(3i)]"
      assert_select "input#model_processor[name=?]", "model[processor]"
      assert_select "input#model_ram[name=?]", "model[ram]"
      assert_select "input#model_storage_capacity[name=?]", "model[storage_capacity]"
      assert_select "input#model_storage_type[name=?]", "model[storage_type]"
      assert_select "input#model_display[name=?]", "model[display]"
      assert_select "input#model_battery_capacity[name=?]", "model[battery_capacity]"
      assert_select "input#model_wifi[name=?]", "model[wifi]"
      assert_select "input#model_bluetooth[name=?]", "model[bluetooth]"
      assert_select "input#model_gps[name=?]", "model[gps]"
      assert_select "input#model_cellular[name=?]", "model[cellular]"
      assert_select "input#model_camera[name=?]", "model[camera]"
      assert_select "input#model_size[name=?]", "model[size]"
      assert_select "input#model_weight[name=?]", "model[weight]"
    end
  end
end
