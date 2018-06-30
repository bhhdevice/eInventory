class EquipmentController < InheritedResources::Base
  before_action :set_object, only: [:edit, :update, :destroy]
  before_action :load_brands, only: [:edit, :new, :create, :update]
  before_action :load_models, only: [:edit, :new, :create, :update]

  def index
    @equipment = Equipment.all.sort_by(&:category)
  end

  def new
    @equipment = Equipment.new
  end

  def edit
    @models = [@equipment.model]
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to equipment_index_path
    else
      render :new
    end
  end

  def update
    if equipment_params[:model_id].nil?
      @equipment.model = nil;
    end
    if @equipment.update_attributes(equipment_params)
      redirect_to equipment_index_path
    else
      render :edit
    end
  end

  def destroy
    @equipment.destroy
    redirect_to equipment_index_path, notice: 'Equipment removed successfully'
  end

  def models
    respond_to do |format|
      format.json do
        @brand = Brand.find(params[:brandID])
        render json: @brand.models.sort_by(&:name).as_json(only: [:name, :id, :category])
      end
      format.html { redirect_to root_path }
    end
  end

  def category
    respond_to do |format|
      format.json do
        model = Model.find(params[:modelID])
        render json: model.category.as_json(only: [:name])
      end
      format.html { redirect_to root_path }
    end
  end

  private

    def as_json(options={})
      super(only: [:id])
    end

    def load_brands
      @brands = Brand.all.sort_by(&:name)
    end

    def load_models
      return @models = [] unless params[:equipment].present? && equipment_params[:model_id].present?
      @models = Model.where(id: equipment_params[:model_id])
    end

    def set_object
      @equipment = load_resource('equipment')
    end

    def equipment_params
      params.require(:equipment).permit(:model_id, :brand_id, :category_id, :asset_tag, :hostname, :serial_number,
                                        :phone_number, :sim_number, :imei, :device_number)
    end
end
