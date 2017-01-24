class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carts
  has_many :items, through: :carts

  before_initialize :check_for_open_orders

  def check_for_open_orders
    binding.pry
  end
end
