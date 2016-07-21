class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def customers_pending_invoices
    customers.joins(:invoices).
    joins("INNER JOIN transactions on transactions.invoice_id=invoices.id").
    where("transactions.result='failed'").
    distinct
  end

end
