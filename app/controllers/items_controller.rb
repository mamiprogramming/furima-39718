class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :contributor, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :explain, :item_name, :category_id, :situation_id, :postage_id, :prefecture_id,
                                 :amountday_id, :price).merge(user_id: current_user.id)
  end

  def contributor
    if @item.sold_out?
      redirect_to root_path
    else
      redirect_to root_path unless current_user == @item.user
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
