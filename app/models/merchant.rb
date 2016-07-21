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

  def revenue_for_date
    successful_invoice_items.
    sum("invoice_items.quantity*CAST(invoice_items.unit_price AS integer)")
    # { "revenue" => (revenue/ 100.0).to_s }
  end

end
