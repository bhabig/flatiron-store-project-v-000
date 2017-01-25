class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    where("inventory > 0")
  end

  def display_price
    self.price/100
  end

  def amount_sold(quantity)
    self.inventory -= quantity
    self.save
  end

end
