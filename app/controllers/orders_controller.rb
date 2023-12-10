class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_item, only: [:index, :create]
  before_action :check_user, only: [:index]

  def index
    @order = Order.new
    @orders = Order.all
  end

  def create
    if @item.user_id == current_user.id
      redirect_to root_path
      return
    end
  
    @order_address = OrderAddress.new(order_params.merge(user_id: current_user.id))
  
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def load_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :street_number, :building, :telephone).merge(user_id: current_user.id)
  end

  def check_user
    redirect_to root_path if user_signed_in? && @item.user_id == current_user.id
  end
end
