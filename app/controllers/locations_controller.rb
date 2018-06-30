class LocationsController < ApplicationController
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit

  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: 'Location removed successfully'
  end

  private

    def set_object
      @location = load_resource('location')
    end

    def location_params
      params.require(:location).permit(:name, :address, :city, :state, :zip_code, :phone_number)
    end
end
