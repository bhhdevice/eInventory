module Admin
  class AssignmentsController < Admin::ApplicationController
    include AssignmentsHelper
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Assignment.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Assignment.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def quick_add
      @assignment = Assignment.new
      render :quick_add
    end

    def quick_create
      @assignment = Assignment.new(quick_params)
      if Assignment.quick_add(@assignment, quick_params)
        flash[:notice] = "All equipment assigned successfully."
        redirect_to assignments_quick_add_path
      else
        render :quick_add
      end
    end

    private

      def quick_params
        params.require(:assignment).permit(:user_search, :tablet_search, :cell_search, :smart_charger, :cell_phone_charger, :tablet_keyboard, :tablet_mouse, :id)
      end

  end
end
