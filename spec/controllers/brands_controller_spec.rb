require 'rails_helper'

RSpec.describe BrandsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Brand. As you add validations to Brand, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: 'Clinical Informatics',
      address: '123 Fake St',
      city: 'City',
      state: 'AL',
      zip_code: '12345',
      phone_number: '123-123-1234',
      website: 'www.test.com'
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      address: '',
      city: '',
      state: '',
      zip_code: '',
      phone_number: '',
      website: ''
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BrandsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      brand = Brand.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      brand = Brand.create! valid_attributes
      get :show, params: {id: brand.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      brand = Brand.create! valid_attributes
      get :edit, params: {id: brand.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Brand" do
        expect {
          post :create, params: {brand: valid_attributes}, session: valid_session
        }.to change(Brand, :count).by(1)
      end

      it "redirects to the created brand" do
        post :create, params: {brand: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Brand.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {brand: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested brand" do
        brand = Brand.create! valid_attributes
        put :update, params: {id: brand.to_param, brand: new_attributes}, session: valid_session
        brand.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the brand" do
        brand = Brand.create! valid_attributes
        put :update, params: {id: brand.to_param, brand: valid_attributes}, session: valid_session
        expect(response).to redirect_to(brand)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        brand = Brand.create! valid_attributes
        put :update, params: {id: brand.to_param, brand: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested brand" do
      brand = Brand.create! valid_attributes
      expect {
        delete :destroy, params: {id: brand.to_param}, session: valid_session
      }.to change(Brand, :count).by(-1)
    end

    it "redirects to the brands list" do
      brand = Brand.create! valid_attributes
      delete :destroy, params: {id: brand.to_param}, session: valid_session
      expect(response).to redirect_to(brands_url)
    end
  end

end
