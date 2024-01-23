class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_user_session_path, notice: 'ログインが必要です。'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :item_status_id, :price, :item_detail, :region_id, :shipping_day_id, :shipping_fee_id, :image).merge(user_id: current_user.id)
  end

end
