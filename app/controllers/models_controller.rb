class ModelsController < InheritedResources::Base
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def edit

  end

  def create
    @model = Model.new(model_params)
    if @model.save
      redirect_to models_path
    else
      render :new
    end
  end

  def update
    if @model.update_attributes(model_params)
      redirect_to models_path
    else
      render :edit
    end
  end

  def destroy
    @model.destroy
    redirect_to models_path, notice: 'Model removed successfully'
  end

  private

    def set_object
      @model = load_resource('model')
    end

    def model_params
      params.require(:model).permit(:name, :release_date, :brand_id, :category_id, :processor, :ram,
                                    :storage_capacity, :storage_type, :display, :battery_capacity,
                                    :wifi, :bluetooth, :gps, :cellular, :camera, :size, :weight)
    end
end
