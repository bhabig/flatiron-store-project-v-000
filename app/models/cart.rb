class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  validates_uniqueness_of :id

  def total
    self.line_items.map do |line_item|
      item = Item.find(line_item.item_id)
      item.price * line_item.quantity
    end.sum
  end

  def add_item(item_id)
    l = LineItem.where(:item_id => item_id, :cart_id => self.id).first_or_initialize
    self.line_items << l
  end

  def checkout
    self.status = true if self.status != true
  end

  def cart_status
    if self.status == true
      "submitted"
    else
      "unsubmitted"
    end
  end

end
