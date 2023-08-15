class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]

  def index
    @operations = Operation.all
  end

  def show
  end

  def new
    @operation = Operation.new
  end

  def edit
  end

  def create
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        redirect_to operation_url(@operation), notice: "Operation was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @operation.update(operation_params)
        redirect_to operation_url(@operation), notice: "Operation was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @operation.destroy
    redirect_to operations_url, notice: "Operation was successfully destroyed."
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.fetch(:operation, {})
  end
end
