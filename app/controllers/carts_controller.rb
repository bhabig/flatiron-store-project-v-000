class CartsController < ApplicationController
  before_action :user_signed_in?
  before_action :set_user

  def show

  end

  def checkout
    current_cart = Cart.find_by(id: params[:id])
    current_cart.checkout
    redirect_to cart_path(current_cart)
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :status)
  end
end
