class DepartmentsController < ApplicationController
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit

  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def update
    if @department.update_attributes(department_params)
      redirect_to departments_path
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private

    def set_object
      @department = load_resource('department')
    end

    def department_params
      params.require(:department).permit(:name, :cost_center)
    end
end
