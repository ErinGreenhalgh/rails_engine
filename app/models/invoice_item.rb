class InvoiceItem < ApplicationRecord
  # before_save :format_price

  belongs_to :item
  belongs_to :invoice

  validates :unit_price, :presence => true

  # def format_price
  #   self.unit_price = (unit_price.to_i / 100.0)
  # end
end
