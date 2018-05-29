class LocationsController < ApplicationController

  def index

  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end 

  private

    def location_params
      params.require(:location).permit()
    end
end
