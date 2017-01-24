class ItemsController < ApplicationController
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
