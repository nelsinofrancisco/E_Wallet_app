class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)
    respond_to do |format|
      format.html do
        if @category.save
          flash[:notice] = 'Category was successfully created.'
        else
          flash[:alert] = "Failed to add category - #{@recipe.errors.full_messages.first}"
        end
        redirect_to categories_path
      end
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = 'category deleted!'
    else
      flash[:alert] = "Failed to remove category - #{recipe.errors.full_messages.first}"
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end