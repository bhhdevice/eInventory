require 'rails_helper'

RSpec.describe ModelsController, type: :controller do

  before(:each) do
    @brand = create(:brand)
    @category = create(:category)
    login_admin
  end

  let(:valid_attributes) {
    {
      name: 'SM12345',
      release_date: Date.today,
      brand_id: @brand.id,
      category_id: @category.id
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      release_date: nil,
      brand_id: nil,
      category_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ModelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      model = Model.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     model = Model.create! valid_attributes
  #     get :show, params: {id: model.to_param}, session: valid_session
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
      model = Model.create! valid_attributes
      get :edit, params: {id: model.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Model" do
        expect {
          post :create, params: {model: valid_attributes}, session: valid_session
        }.to change(Model, :count).by(1)
      end

      it "redirects to the created model" do
        post :create, params: {model: valid_attributes}, session: valid_session
        expect(response).to redirect_to(models_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {model: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested model" do
        model = Model.create! valid_attributes
        put :update, params: {id: model.to_param, model: new_attributes}, session: valid_session
        model.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the model" do
        model = Model.create! valid_attributes
        put :update, params: {id: model.to_param, model: valid_attributes}, session: valid_session
        expect(response).to redirect_to(models_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        model = Model.create! valid_attributes
        put :update, params: {id: model.to_param, model: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested model" do
      model = Model.create! valid_attributes
      expect {
        delete :destroy, params: {id: model.to_param}, session: valid_session
      }.to change(Model, :count).by(-1)
    end

    it "redirects to the models list" do
      model = Model.create! valid_attributes
      delete :destroy, params: {id: model.to_param}, session: valid_session
      expect(response).to redirect_to(models_url)
    end
  end

end
