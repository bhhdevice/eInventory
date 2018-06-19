require 'rails_helper'

RSpec.describe "models/index", type: :view do
  before(:each) do
    assign(:models, [
      create(:model),
      create(:model)
    ])
  end

  it "renders a list of models" do
    render
  end
end
