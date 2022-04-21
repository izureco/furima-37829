class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def new
    @purchase = PurchasePhistory.new
      # URIパターンがネストして、item_idがパスに含まれているから。paramsにはitem_id
  end

  def create
    @purchase = PurchasePhistory.new(ph_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def ph_params
    params.require(:purchase_phistory).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :build_number,
      :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: @item.id,
      token: params[:token]
    )
  end

  def move_to_index
    if user_signed_in?
      item = Item.find(params[:item_id])

      # 自分の出品した商品を購入しようとすると、indexに遷移する
      if current_user.id == item.user_id
        redirect_to root_path and return
      end

      # すでに購入済の商品を再度購入しようとすると、indexに遷移する
      if PurchaseHistory.exists?(item_id: item.id)
        redirect_to root_path and return
      end
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: ph_params[:token],
      currency: 'jpy'
    )
  end
end
