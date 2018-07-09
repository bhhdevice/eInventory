require 'rails_helper'

RSpec.describe EquipmentController, type: :controller do

  before(:each) do
    @brand = create(:brand)
    @model = create(:model, brand: @brand)
    login_admin
  end

  # This should return the minimal set of attributes required to create a valid
  # Equipment. As you add validations to Equipment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      brand_id: @brand.id,
      model_id: @model.id
    }
  }

  let(:invalid_attributes) {
    {
      brand_id: nil,
      model_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EquipmentController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      equipment = Equipment.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      equipment = Equipment.create! valid_attributes
      get :show, params: {id: equipment.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      equipment = Equipment.create! valid_attributes
      get :edit, params: {id: equipment.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Equipment" do
        expect {
          post :create, params: {equipment: valid_attributes}, session: valid_session
        }.to change(Equipment, :count).by(1)
      end

      it "redirects to the created equipment" do
        post :create, params: {equipment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(equipment_index_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {equipment: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          brand_id: @brand.id,
          model_id: @model.id
        }
      }

      it "updates the requested equipment" do
        equipment = Equipment.create! valid_attributes
        put :update, params: {id: equipment.to_param, equipment: new_attributes}, session: valid_session
        equipment.reload
        expect(equipment.brand).to eq(@brand)
        expect(equipment.model).to eq(@model)
      end

      it "redirects to the equipment" do
        equipment = Equipment.create! valid_attributes
        put :update, params: {id: equipment.to_param, equipment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(equipment_index_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        equipment = Equipment.create! valid_attributes
        put :update, params: {id: equipment.to_param, equipment: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested equipment" do
      equipment = Equipment.create! valid_attributes
      expect {
        delete :destroy, params: {id: equipment.to_param}, session: valid_session
      }.to change(Equipment, :count).by(-1)
    end

    it "redirects to the equipment list" do
      equipment = Equipment.create! valid_attributes
      delete :destroy, params: {id: equipment.to_param}, session: valid_session
      expect(response).to redirect_to(equipment_index_url)
    end
  end

end
