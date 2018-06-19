require "rails_helper"

RSpec.describe ModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/models").to route_to("models#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/models/new").to route_to("models#new")
    end

    # it "routes to #show" do
    #   expect(:get => "/admin/models/1").to route_to("models#show", :id => "1")
    # end

    it "routes to #edit" do
      expect(:get => "/admin/models/1/edit").to route_to("models#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/models").to route_to("models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/models/1").to route_to("models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/models/1").to route_to("models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/models/1").to route_to("models#destroy", :id => "1")
    end

  end
end
