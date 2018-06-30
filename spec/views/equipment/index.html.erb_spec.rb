require 'rails_helper'

RSpec.describe "equipment/index", type: :view do
  before(:each) do
    @brand = create(:brand)
    @model = create(:model, brand: @brand)
    assign(:equipment, [
      create(:equipment, brand: @brand, model: @model),
      create(:equipment, brand: @brand, model: @model)
    ])
  end

  it "renders a list of equipment" do
    render
  end
end
