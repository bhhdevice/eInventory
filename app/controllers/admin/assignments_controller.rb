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
      @user_id = ""
      @equipment_id = ""
      render 'quick_add'
    end

    def quick_create
      @assignment = Assignment.new
      equip_param_arr = quick_params[:equipment_id].split(" ")
      user_param_arr = quick_params[:user_id].split(" ")
      user = []
      equip = []
      equip_param_arr.each do |e|
        equip = Equipment.where("asset_tag LIKE ? OR phone_number LIKE ?", "%#{e}%", "%#{e}%")
      end
      user_param_arr.each do |u|
        last_name = ""
        first_name = ""
        if user_param_arr.length >= 2
          first_name = user_param_arr[0]
          last_name = user_param_arr[1]
        end
        user = User.where("first_name ILIKE ? AND last_name ILIKE ? OR employee_number LIKE ? OR first_name ILIKE ? OR last_name ILIKE ?", "%#{first_name}%", "%#{last_name}%", "%#{u}%", "%#{u}%", "%#{u}%")
      end

      if user.count > 1
        @assignment.errors.add(:user_id, "Data entered returned multiple users")
      end
      if equip.count > 1
        @assignment.errors.add(:equipment_id, "Data entered returned multiple equipment")
      end
      @assignment.update(user: user.first, equipment: equip.first)
      if @assignment.save
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
