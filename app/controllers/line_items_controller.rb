class LineItemsController < ApplicationController
  before_action :set_user
  before_action :check_logged_in?
  before_action :alias_to

  def create ###clunky and repetetive but it works to prevent checked out
    #carts from being current_carts and keeps forgotten uncheckout carts from
    #existing. refactor coming
    if !@current_cart || @current_cart.status == true
      cc = Cart.find_current_cart(current_user.id)
      if cc
        current_user.current_cart = cc
        current_user.save
        @current_cart = current_user.current_cart
      else
        current_user.current_cart = Cart.create(user_id: current_user.id)
        current_user.save
        @current_cart = current_user.current_cart
      end
    end

    line_item = @current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(@current_cart)
    else
      redirect_to root_path
    end
  end
end
