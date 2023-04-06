class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :refresh_list_ids_in_cookies

  def index
    @lists = List.where(share_id: list_ids_from_cookies)
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
      add_list_to_user_cookies
      redirect_to list_path(@list, locale: I18n.locale)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list, locale: I18n.locale)
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

  def list_ids_from_cookies
    return [] unless cookies[:lists]

    JSON.parse(cookies[:lists])
  end

  def add_list_to_user_cookies
    list_share_ids = cookies[:lists] ? JSON.parse(cookies[:lists]) : []
    list_share_ids << @list.share_id

    cookies[:lists] = JSON.generate list_share_ids
  end

  def refresh_list_ids_in_cookies
    return unless cookies[:lists]

    list_share_ids = JSON.parse(cookies[:lists])
    list_share_ids = List.where(share_id: list_share_ids).pluck :share_id

    cookies[:lists] = JSON.generate list_share_ids
  end
end
