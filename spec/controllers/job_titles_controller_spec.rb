require 'rails_helper'

RSpec.describe JobTitlesController, type: :controller do

  before(:each) do
    login_admin
  end

  let(:valid_attributes) {
    {
      name: 'technical specialist'
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      job_title = JobTitle.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  # Show functionality is not required and has been disabled
  # describe "GET #show" do
  #   it "returns a success response" do
  #     job_title = JobTitle.create! valid_attributes
  #     get :show, params: {id: job_title.to_param}, session: valid_session
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
      job_title = JobTitle.create! valid_attributes
      get :edit, params: {id: job_title.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new JobTitle" do
        expect {
          post :create, params: {job_title: valid_attributes}, session: valid_session
        }.to change(JobTitle, :count).by(1)
      end

      it "redirects to the job_titles page" do
        post :create, params: {job_title: valid_attributes}, session: valid_session
        expect(response).to redirect_to(job_titles_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {job_title: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: 'Clinical Manager'
        }
      }

      it "updates the requested job_title" do
        job_title = JobTitle.create! valid_attributes
        put :update, params: {id: job_title.to_param, job_title: new_attributes}, session: valid_session
        job_title.reload
        expect(job_title.name).to eq('Clinical Manager')
      end

      it "redirects to the job_titles page" do
        job_title = JobTitle.create! valid_attributes
        put :update, params: {id: job_title.to_param, job_title: valid_attributes}, session: valid_session
        expect(response).to redirect_to(job_titles_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        job_title = JobTitle.create! valid_attributes
        put :update, params: {id: job_title.to_param, job_title: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested job_title" do
      job_title = JobTitle.create! valid_attributes
      expect {
        delete :destroy, params: {id: job_title.to_param}, session: valid_session
      }.to change(JobTitle, :count).by(-1)
    end

    it "redirects to the job_titles page" do
      job_title = JobTitle.create! valid_attributes
      delete :destroy, params: {id: job_title.to_param}, session: valid_session
      expect(response).to redirect_to(job_titles_url)
    end
  end

end
