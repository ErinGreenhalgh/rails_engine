class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price

  def unit_price
    price = object.unit_price
    price[0...-2] + "." + price[-2..-1]
  end
end
