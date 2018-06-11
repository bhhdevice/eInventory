class CategoriesController < InheritedResources::Base
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

    def set_object
      @category = load_resource('category')
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
