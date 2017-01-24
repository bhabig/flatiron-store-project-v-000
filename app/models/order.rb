class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carts
  has_many :items, through: :carts

  
end
