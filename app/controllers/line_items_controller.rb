class LineItemsController < ApplicationController
  before_action :set_user
  before_action :check_logged_in?

  def create
    if !current_user.current_cart
      current_user.current_cart = Cart.new(user_id: current_user.id)
      current_user.current_cart.save
      current_user.current_cart.add_item(params[:item_id])
    else
      current_user.current_cart.add_item(params[:item_id])
      current_user.current_cart.save
    end
    redirect_to cart_path(current_user.current_cart)
  end

  def destroy
  end

  private

  def line_item_params
    params.require(:line_item).permit(:cart_id, :item_id, :quantity)
  end
end
