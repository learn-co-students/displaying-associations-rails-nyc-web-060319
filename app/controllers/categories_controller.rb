class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def category_params(params)
    params.require(:category).permit(:name)
  end

  def create
    category = Category.create(category_params(params))
    redirect_to category_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params(params))
    redirect_to category_path(category)
  end
end
