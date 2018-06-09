class UsersController < ApplicationController
  before_action :set_object, only: [:show, :edit, :update, :destroy]
  before_action :get_managers, except: :index

  def index
    @users = User.all.where.not(id: current_user)
  end

  def new
    @user = User.new
  end

  def edit
    if @user == current_user
      redirect_to edit_user_registration_path
    end
  end

  def create
    @user = User.new(user_params_no_password)
    @user.update(password_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    @user.update(user_params_no_password)
    if user_params_no_password[:disable_login] == 'true'
      @user.lock_access!
    elsif user_params_no_password[:disable_login] == 'false'
      @user.unlock_access!
    end
    if password_params[:password].present?
      @user.update(password_params)
    end
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

    def set_object
      @user = load_resource('users')
    end

    def user_params_no_password
      params.require(:user).permit(:first_name, :last_name, :location_id, :department_id, :phone_number,
                                   :reports_to_id, :disable_login, :status_id, :reports_to_type, :employee_number,
                                   :address, :state, :city, :zip_code, :job_title_id, :admin,
                                   :manager, :email)
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
