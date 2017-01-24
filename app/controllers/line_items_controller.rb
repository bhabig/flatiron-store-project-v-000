class LineItemsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  private

  def line_item_params
    params.require(:line_items).permit(:cart_id, :item_id, :quantity)
  end
end
