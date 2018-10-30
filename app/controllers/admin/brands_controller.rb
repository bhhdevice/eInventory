module Admin
  class BrandsController < Admin::ApplicationController
    before_action :set_object, only: [:edit, :update, :destroy]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      @resources = Brand.
        page(params[:page]).
        per(10).sort_by(&:name)
    end

    def update
      if @brand.update_attributes(brand_params)
        redirect_to admin_brands_path, notice: 'Brand updated successfully'
      else
        render :edit
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Brand.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    private

      def set_object
        @brand = load_resource('brand')
      end


      def brand_params
        params.require(:brand).permit(:name, :address, :city, :state, :zip_code, :phone_number, :website)
      end

  end
end
