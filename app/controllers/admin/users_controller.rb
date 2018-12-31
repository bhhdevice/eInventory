module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_object, only: [:show, :edit, :update, :destroy]
    before_action :get_managers, except: :index
    before_action :set_page, only: [:create, :update]
    after_action :check_account!, only: [:create, :update]

    def index
      super
      @users = User.all.where.not(id: current_user)
    end

    def edit
      if @user == current_user
        redirect_to edit_user_registration_path
      else
        super
      end
    end

    def create
      @user = User.new(user_params_no_password)
      @user.update(password_params)
      if @user.save
        redirect_to admin_users_path, notice: "User created successfully"
      else
        #updates page resource
        @page = Administrate::Page::Form.new(dashboard, @user)
        render :new, locals: { page: @page }
      end
    end

    def update
      @user.update(user_params_no_password)
      if @user.locked_at.blank? && user_params_no_password[:disable_login] == 'true'
        @user.lock_access!
      elsif @user.locked_at? && user_params_no_password[:disable_login] == 'false'
        @user.unlock_access!
      end
      if password_params[:password].present?
        @user.update(password_params)
      end
      if @user.save
        redirect_to admin_users_path, notice: "User updated successfully"
      else
        render :edit, locals: { page: @page }
      end
    end


    private

      def set_page
        @page = Administrate::Page::Form.new(dashboard, @user)
      end

      def set_object
        @user = load_resource('users')
      end

      def check_account!
        @user = User.last
        if @user.disable_login
          @user.lock_access!
        else
          @user.unlock_access!
        end
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

      def bypass_password(resource, password= "DisabledUser")
        if resource.disable_login

        end
        resource.save ? true : false
      end
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
