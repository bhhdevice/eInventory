class DepartmentsController < ApplicationController

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

    def department_params
      params.require(:department).permit()
    end
end
