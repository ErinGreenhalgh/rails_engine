class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.
    joins(invoices: [:transactions]).
    where(transactions: {result: "success"}).
    select("merchants.id, merchants.name, count(transactions.id) AS num_trans").
    group("merchants.id").
    order("num_trans DESC").
    limit(1).take 
  end
end
