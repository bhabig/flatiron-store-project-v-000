class UsersController < ApplicationController


  def new

  end

  def create
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :name, :current_cart_id)
  end
end
