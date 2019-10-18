module Admin
  class AssignmentsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    include AssignmentsHelper
    include AdministrateExportable::Exporter
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
    # def update
    #   foo = Foo.find(params[:id])
    #   foo.update(params[:foo])
    #   send_foo_updated_email
    # end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #  if current_user.super_admin?
    #    resource_class
    #  else
    #    resource_class.with_less_stuff
    #  end
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
