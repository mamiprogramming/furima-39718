class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :explain, :item_name, :category_id, :situation_id, :postage_id, :prefecture_id,
                                 :amountday_id, :price).merge(user_id: current_user.id)
  end
end
