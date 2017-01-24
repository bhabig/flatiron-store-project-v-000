class CartsController < ApplicationController
  before_action :user_signed_in?
  before_action :set_user

  def create
    
  end

  def show
    @user.current_cart = @user.carts.last
  end

  def checkout
    @user.current_cart = Cart.find_by(id: params[:id])
    @user.current_cart.checkout
    redirect_to cart_path(@user.current_cart)
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :status)
  end
end
