class LineItemsController < ApplicationController
  before_action :set_user
  before_action :check_logged_in?
  before_action :alias_to

  def create
    @current_cart = Cart.create(user_id: current_user.id) unless @current_cart
    @user.current_cart_id = @current_cart.id
    @user.save #avoids changing multiple arguments already set as '@current_cart'
    line_item = @current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(@current_cart)
    else
      redirect_to root_path
    end
  end

  def destroy
  end

end
