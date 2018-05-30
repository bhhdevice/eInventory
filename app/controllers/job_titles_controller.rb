class JobTitlesController < ApplicationController
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @job_titles = JobTitle.all
  end

  def show

  end

  def new
    @job_title = JobTitle.new
  end

  def edit

  end

  def create
    @job_title = JobTitle.new(job_title_params)
    if @job_title.save
      redirect_to job_titles_path
    else
      render :new
    end
  end

  def update
    if @job_title.update_attributes(job_title_params)
      redirect_to job_titles_path
    else
      render :edit
    end
  end

  def destroy
    @job_title.destroy
    redirect_to job_titles_path
  end

  private

    def set_object
      @job_title = load_resource('job_title')
    end

    def job_title_params
      params.require(:job_title).permit(:name)
    end
end
