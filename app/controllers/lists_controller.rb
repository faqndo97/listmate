class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @list.items.build
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "List was successfully created."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find_by!(share_id: params[:share_id])
  end

  def list_params
    params.require(:list).permit(:title, items_attributes: [:id, :description, :completed, :_destroy])
  end
end
