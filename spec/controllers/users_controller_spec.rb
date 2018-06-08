require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    login_admin
    @job_title = create(:job_title)
    @department = create(:department)
    @location = create(:location)
    @status = create(:status)
  end

  let(:valid_attributes) {
    {
      first_name: 'John',
      last_name: 'Smith',
      employee_number: "EN#{rand(5 ** 5).to_s.rjust(5,'0')}",
      job_title_id: @job_title.id,
      department_id: @department.id,
      location_id: @location.id,
      status_id: @status.id,
      disable_login: false,
      email: "john.smith#{rand(5 ** 5)}@test.com",
      password: "Pa$$word",
      password_confirmation: "Pa$$word"
    }
  }

  let(:invalid_attributes) {
    {
      first_name: '',
      last_name: '',
      user: nil,
      employee_number: '',
      department: nil,
      location: nil,
      email: '',
      password: ''
    }
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new admin User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to the users page" do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: 'clinical manager'
        }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the users page" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
