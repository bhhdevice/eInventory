require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

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
      disable_login: true,
      email: "john.smith#{rand(5 ** 5)}@test.com",
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
    }
  }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      employee = Employee.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      employee = Employee.create! valid_attributes
      get :show, params: {id: employee.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns a success response" do
  #     employee = Employee.create! valid_attributes
  #     get :edit, params: {id: employee.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Employee" do
  #       expect {
  #         post :create, params: {employee: valid_attributes}, session: valid_session
  #       }.to change(Employee, :count).by(1)
  #     end
  #
  #     it "redirects to the created employee" do
  #       post :create, params: {employee: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(Employee.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {employee: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested employee" do
  #       employee = Employee.create! valid_attributes
  #       put :update, params: {id: employee.to_param, employee: new_attributes}, session: valid_session
  #       employee.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the employee" do
  #       employee = Employee.create! valid_attributes
  #       put :update, params: {id: employee.to_param, employee: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(employee)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       employee = Employee.create! valid_attributes
  #       put :update, params: {id: employee.to_param, employee: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested employee" do
  #     employee = Employee.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: employee.to_param}, session: valid_session
  #     }.to change(Employee, :count).by(-1)
  #   end
  #
  #   it "redirects to the employees list" do
  #     employee = Employee.create! valid_attributes
  #     delete :destroy, params: {id: employee.to_param}, session: valid_session
  #     expect(response).to redirect_to(employees_url)
  #   end
  # end

end
