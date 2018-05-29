class RegistrationsController < Devise::RegistrationsController
  before_action :get_managers, except: [:index]


  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :location_id, :department_id, :phone_number,
                                   :reports_to_id, :employee_number, :address, :state, :city, :zip_code,
                                   :active, :job_title_id, :admin, :manager, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :location_id, :department_id, :phone_number,
                                   :reports_to_id, :employee_number, :address, :state, :city, :zip_code,
                                   :active, :job_title_id, :admin, :manager, :email, :password, :password_confirmation,
                                   :current_password)
    end

end
