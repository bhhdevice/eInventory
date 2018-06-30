require "rails_helper"

RSpec.describe EquipmentController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/equipment").to route_to("equipment#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/equipment/new").to route_to("equipment#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/equipment/1").to route_to("equipment#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/equipment/1/edit").to route_to("equipment#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/equipment").to route_to("equipment#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/equipment/1").to route_to("equipment#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/equipment/1").to route_to("equipment#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/equipment/1").to route_to("equipment#destroy", :id => "1")
    end

  end
end
