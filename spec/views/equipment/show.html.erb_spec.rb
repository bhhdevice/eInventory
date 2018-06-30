require 'rails_helper'

RSpec.describe "equipment/show", type: :view do
  before(:each) do
    @brand = create(:brand)
    @model = create(:model, brand: @brand)
    @equipment = assign(:equipment, create(:equipment, brand: @brand, model: @model))
  end

  it "renders attributes in <p>" do
    render
  end
end
