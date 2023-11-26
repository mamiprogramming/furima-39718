class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
    @category = Category.all
    @situation = Situation.all
    @postage = Postage.all
    @prefecture = Prefecture.all
    @amountday = Amountday.all
  end

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
