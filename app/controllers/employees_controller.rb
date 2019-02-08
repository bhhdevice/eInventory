class EmployeesController < ApplicationController
  before_action :set_object, only: [:show]

  def index
    @employees = Employee.active.not_admin
  end

  def show

  end

  # def new
  #   @employee = Employee.new
  # end

  # def edit
  #   if @employee == current_user
  #     redirect_to edit_user_registration_path
  #   end
  # end
  #
  # def create
  #   @employee = Employee.new(user_params_no_password)
  #   @employee.update(password_params)
  #   if @employee.save
  #     redirect_to users_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def update
  #   @employee.update(user_params_no_password)
  #   if user_params_no_password[:disable_login] == 'true'
  #     @employee.lock_access!
  #   elsif user_params_no_password[:disable_login] == 'false'
  #     @employee.unlock_access!
  #   end
  #   if password_params[:password].present?
  #     @employee.update(password_params)
  #   end
  #   if @employee.save
  #     redirect_to users_path
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @employee.destroy
  #   redirect_to users_path
  # end

  private

    def set_object
      @employee = load_resource('employees')
    end

    # def user_params_no_password
    #   params.require(:employee).permit(:first_name, :last_name, :location_id, :department_id, :phone_number,
    #                                :reports_to_id, :disable_login, :status_id, :reports_to_type, :employee_number,
    #                                :address, :state, :city, :zip_code, :active, :job_title_id, :admin,
    #                                :email)
    # end
    #
    # def password_params
    #   params.require(:user).permit(:password, :password_confirmation)
    # end
end
