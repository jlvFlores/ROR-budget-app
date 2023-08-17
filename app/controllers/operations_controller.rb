class OperationsController < ApplicationController
  def new
    @page_title = 'New transaction'
    @operation = Operation.new
  end

  def create
    @category = Category.find(params[:operation][:category_id])
    @operation = Operation.new(operation_params)
    @operation.author = current_user

    @operation_category = OperationCategory.new
    @operation_category.category = @category
    @operation_category.operation = @operation
    @operation_category.save

    if @operation.save
      redirect_to category_path(@category), notice: 'Operation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def category_params
    params.require(:category).permit(:id)
  end
end
