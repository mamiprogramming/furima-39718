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

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
