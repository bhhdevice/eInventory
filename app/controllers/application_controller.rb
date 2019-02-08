class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, unless: :home_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_managers, if: :devise_controller?
  before_action :set_disable_field, if: :devise_controller?
  before_action :load_states


  protected

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
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number,
                                                        :address, :state, :city, :zip_code, :email,
                                                        :password, :password_confirmation
                                                        ])
    end

    def get_managers
      begin
       @managers = User.managers.where.not('users.id = ? OR users.id = ?', current_user, load_resource('users'))
     rescue ActionController::ParameterMissing
       @managers = User.managers.where.not(id: current_user)
     end
     binding.pry
     @managers = @managers.map { |m| ["#{m.full_name} - #{m.job_title.name}", m.id] }
    end

  private

    def set_disable_field
      if current_user.present? && current_user.admin?
        @disable_field = false
      else
        @disable_field = true
      end
    end

    def home_controller?
      is_a?(HomeController)
    end

    # should only used to load resources from controller actions (:show, :edit, :update, :destroy)
    def load_resource(controller)
      model = controller.classify.constantize
      parameters = params.fetch(controller_path.to_sym, {}).permit(:id)
      parameters.empty? ? parameters = params.require(:id) : nil
      model.find(parameters)
    end

end
