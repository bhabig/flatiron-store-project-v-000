class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
  def new
  end

  def create
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :title, :inventory, :price)
  end
end
