class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_managers, if: :devise_controller?
  before_action :load_states


  protected

    def load_states
      @states = HomeHelper::STATES.sort.map { |k,v| [k,v] }
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location_id, :department_id, :phone_number,
                                                         :employee_number, :address, :state, :city, :zip_code,
                                                         :status_id, :job_title_id, :email, :password, :password_confirmation
                                                         ])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location_id, :department_id, :phone_number,
                                                         :employee_number, :address, :state, :city, :zip_code,
                                                         :status_id, :job_title_id, :admin, :manager, :email, :password, :password_confirmation
                                                        ])
    end

    def get_managers
      begin
       @managers = User.managers.where.not('id = ? OR id = ?', current_user, load_resource('users'))
     rescue ActionController::ParameterMissing
       @managers = User.managers.where.not(id: current_user)
     end
     @managers = @managers.map { |m| ["#{m.full_name} - #{m.job_title.name}", m.id] }
    end

  private

    # should only used to load resources from controller actions (:show, :edit, :update, :destroy)
    def load_resource(controller)
      model = controller.classify.constantize
      parameters = params.fetch(controller_path.to_sym, {}).permit(:id)
      parameters.empty? ? parameters = params.require(:id) : nil
      model.find(parameters)
    end

end
