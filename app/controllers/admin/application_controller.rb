# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    protect_from_forgery
    before_action :authenticate_user!
    before_action :check_admin?
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_managers, if: :user_controller?
    before_action :load_states
    before_action :set_current_user


    protected


      def set_current_user
        User.current = current_user
      end

      def update_stock
        Brand.update_all(stock: [total: self.models.count])
      end

      def load_states
        @states = ApplicationHelper::STATES.sort.map { |k,v| [k,v] }
      end

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location_id, :department_id, :phone_number,
                                                           :employee_number, :address, :state, :city, :zip_code,
                                                           :status_id, :job_title_id, :email, :password, :password_confirmation
                                                           ])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location_id, :department_id, :phone_number,
                                                           :employee_number, :address, :state, :city, :zip_code,
                                                           :status_id, :job_title_id, :admin, :email, :password, :password_confirmation
                                                          ])
      end

      def get_managers
        begin
         @managers = User.managers.where.not('users.id = ? OR users.id = ?', current_user, load_resource('users'))
       rescue ActionController::ParameterMissing
         @managers = User.managers.where.not(id: current_user)
       end
       @managers = @managers.map { |m| ["#{m.full_name} - #{m.job_title.name}", m.id] }
      end

    private

      def user_controller?
        is_a?(::UsersController)
      end

      # should only used to load resources from controller actions (:show, :edit, :update, :destroy)
      def load_resource(controller)
        model = controller.classify.constantize
        parameters = params.fetch(controller_path.to_sym, {}).permit(:id)
        parameters.empty? ? parameters = params.require(:id) : nil
        model.find(parameters)
      end

      def check_admin?
        if !current_user.admin?
          flash[:notice] = "You are not authorized!"
          redirect_to root_path
        end
      end


    def authenticate_admin
      # TODO Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
