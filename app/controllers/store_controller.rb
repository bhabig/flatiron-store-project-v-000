class StoreController < ApplicationController
  before_action :set_user
  before_action :alias_to

  def index
    @categories = Category.all
    @items = Item.where("inventory > 0")
  end
end
