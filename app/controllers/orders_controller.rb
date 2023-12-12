class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_item, only: [:index, :create]
  before_action :check_user, only: [:index]

  def index
    @orders = Order.all
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order_address.item = @item

    if @item.user_id == current_user.id
      redirect_to root_path
      return
    end
  
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      puts @order_address.errors.full_messages
      render :index, status: :unprocessable_entity
    end
  end

  private

  def load_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :street_number, :building, :telephone).merge(user_id: current_user.id, item_id: @item.id)
  end

  def check_user
    redirect_to root_path if user_signed_in? && @item.user_id == current_user.id
  end
end
