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

  def self.revenue_for_date_accross_all_merchants(date)
    joins(:invoices, :transactions, :invoice_items).
    where.not("transactions.result = 'failed'").
    where(invoices: {created_at: date}).
    sum("invoice_items.quantity*CAST(invoice_items.unit_price AS integer)")
  end

end
