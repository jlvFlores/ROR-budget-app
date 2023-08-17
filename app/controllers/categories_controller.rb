class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @page_title = 'Home'
    @categories = Category.where(user: current_user).all
  end

  def show
    @page_title = 'Transactions'
    @category = Category.find(params[:id])
    @operations = @category.operations
  end

  def new
    @page_title = 'New category'
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
