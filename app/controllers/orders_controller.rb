class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.item_id = params[:item_id]
    @order.user_id = current_user.id
  
    if @order.save
      address_params = order_params.merge(order_id: @order.id)
      Address.create(address_params)
      redirect_to root_path
    else
      Rails.logger.error(@order.errors.full_messages.join(', '))
      render 'index', status: :unprocessable_entity
    end
  end

    private

  def order_params
    params.require(:order).permit(:zip, :prefecture_id, :city, :street_number, :building, :telephone)
  end

end
