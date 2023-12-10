class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_item, only: [:index, :create]
  before_action :check_user, only: [:index]

  def index
    @order = Order.new
    @orders = Order.all
  end

  def create
    @order = Order.new
    @order.item_id = params[:item_id]
    @order.user_id = current_user.id

    if @item.user_id == current_user.id
      redirect_to root_path
      return
    end
  
    if @order.save
      address_params = order_params.merge(order_id: @order.id)
      Address.create(address_params)
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def load_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:zip, :prefecture_id, :city, :street_number, :building, :telephone)
  end

  def check_user
    return unless user_signed_in? && @item.user_id == current_user.id
    redirect_to root_path
  end
end
