class CartsController < ApplicationController
  before_action :user_signed_in?
  before_action :set_user

  def show
    @current_cart = @user.carts.last
  end

  def checkout
    @current_cart = Cart.find_by(id: params[:id])
    @current_cart.checkout
    @current_cart.inventory_after_checkout
    @current_cart.save
    redirect_to cart_path(@current_cart)
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :status)
  end

end
