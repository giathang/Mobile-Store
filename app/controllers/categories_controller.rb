class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to products_path
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def get_category
    @category = Category.find(params[:id])
  end
end
