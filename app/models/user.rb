class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :carts
  has_many :line_items, through: :carts
  belongs_to :current_cart, :class_name => 'Cart'
end
