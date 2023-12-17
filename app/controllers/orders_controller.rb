class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_item, only: [:index, :create]
  before_action :check_user, only: [:index]
  before_action :check_item_sold, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
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
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def load_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :street_number, :building, :telephone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price
    )
  end

  def check_user
    redirect_to root_path if user_signed_in? && @item.user_id == current_user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_item_sold
    return unless @item.sold_out?

    redirect_to root_path
  end
end
