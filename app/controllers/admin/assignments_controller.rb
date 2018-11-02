module Admin
  class AssignmentsController < Admin::ApplicationController
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
      @assignment = Assignment.new
      equip_param_arr = quick_params[:equipment_id].split(" ")
      user_param_arr = quick_params[:user_id].split(" ")
      equip = Equipment.joins(:model).joins(:brand).where("equipment.asset_tag LIKE ? OR equipment.phone_number LIKE ? OR models.name ILIKE ? OR brands.name ILIKE ?", "%#{equip_param_arr[0]}%", "%#{equip_param_arr[1] || equip_param_arr[0]}%", "%#{equip_param_arr[2] || equip_param_arr[0]}%", "%#{equip_param_arr[3] || equip_param_arr[0]}%")
      user = User.where("last_name ILIKE ? OR employee_number LIKE ? OR first_name ILIKE ? AND last_name ILIKE ?", "%#{user_param_arr[0]}%", "%#{user_param_arr[1] || user_param_arr[0]}%", "%#{user_param_arr[0]}%", "%#{user_param_arr[1]}%")

      while user.count > 1 || equip.count > 1 do
        if user.count > 1
          @assignment.errors.add(:user_id, "Data entered returned multiple users")
        end
        if equip.count > 1
          @assignment.errors.add(:equipment_id, "Data entered returned multiple equipment")
        end
        return render :quick_add
      end

      if @assignment.update(user: user.first, equipment: equip.first)
        flash[:notice] = "Assignment created successfully."
        redirect_to assignments_quick_add_path
      else
        render :quick_add
      end
    end

    private

      def quick_params
        params.require(:assignment).permit(:user_id, :equipment_id, :id)
      end

  end
end
