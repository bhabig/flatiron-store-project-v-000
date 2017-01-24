class OrdersController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :cart_id)
  end
end
