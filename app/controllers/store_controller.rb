class StoreController < ApplicationController
  before_action :check_logged_in?
  before_action :set_user

  def index
    @categories = Category.all
    @items = Item.where("inventory > 0")
  end

end
