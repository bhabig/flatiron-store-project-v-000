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
    line_item = self.line_items.find_by_id(item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.new(item_id: item_id)
    end
    line_item
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
