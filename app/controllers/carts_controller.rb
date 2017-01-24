class CartsController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = current_user
  end

  def checkout
  end
end
