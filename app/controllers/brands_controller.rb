class BrandsController < ApplicationController
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.all.sort_by(&:name)
  end

  def new
    @brand = Brand.new
  end

  def edit

  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brands_path
    else
      render :new
    end
  end

  def update
    if @brand.update_attributes(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_path, notice: 'Brand removed successfully'
  end

  private

    def set_object
      @brand = load_resource('brand')
    end

    def brand_params
      params.require(:brand).permit(:name, :address, :city, :state, :zip_code, :phone_number, :website)
    end
end
