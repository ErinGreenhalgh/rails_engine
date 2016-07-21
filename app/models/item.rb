class Item < ApplicationRecord
  before_save :format_price

  belongs_to :merchant
  has_many   :invoice_items

  validates :unit_price, :presence => true

  default_scope {order("id ASC")}

  def format_price
    self.unit_price = (unit_price.to_i / 100.00).round(2)
  end
end
