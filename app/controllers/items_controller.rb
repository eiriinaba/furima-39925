class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
     redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :item_status_id, :price, :item_detail, :region_id, :shipping_day_id, :shipping_fee_id, :image).merge(user_id: current_user.id)
  end

end
