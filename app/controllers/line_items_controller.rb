class LineItemsController < ApplicationController
  before_action :set_user
  before_action :check_logged_in?
  before_action :alias_to

  def create
    cart_existence_or_status
    line_item = @current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(@current_cart)
    else
      redirect_to root_path
    end
  end

  private

  def cart_existence_or_status
    if !@current_cart || @current_cart.status == true
      current_user.current_cart = Cart.create(user_id: current_user.id)
      current_user.save
      @current_cart = current_user.current_cart
    end
  end
end
