class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in?
      item = Item.find(params[:id])
      unless current_user.id == item.user_id
        redirect_to action: :index and return
      end
      if PurchaseHistory.exists?(item_id: item.id)
        redirect_to action: :index and return
      end
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
