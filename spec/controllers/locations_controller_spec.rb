require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  before(:each) do
    login_admin
  end

  let(:valid_attributes) {
    {
      name: 'Clinical Informatics',
      address: '123 Fake St',
      city: 'City',
      state: 'AL',
      zip_code: '12345',
      phone_number: '123-123-1234'
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      address: '',
      city: '',
      state: '123',
      zip_code: '123456',
      phone_number: ''
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LocationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  # Show functionality is not required and has been disabled
  # describe "GET #show" do
  #   it "returns a success response" do
  #     location = Location.create! valid_attributes
  #     get :show, params: {id: location.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :edit, params: {id: location.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, params: {location: valid_attributes}, session: valid_session
        }.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        post :create, params: {location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(locations_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {location: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested location" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: new_attributes}, session: valid_session
        location.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the location" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(locations_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, params: {id: location.to_param}, session: valid_session
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = Location.create! valid_attributes
      delete :destroy, params: {id: location.to_param}, session: valid_session
      expect(response).to redirect_to(locations_url)
    end
  end

end
