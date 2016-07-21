class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers,    through: :invoices

  def customers_pending_invoices
    customers.joins(:invoices)
    .joins("INNER JOIN transactions on transactions.invoice_id=invoices.id")
    .where("transactions.result='failed'")
    .distinct
  end

  def self.revenue_for_date_accross_all_merchants(date)
    revenue = joins(invoices: [:transactions, :invoice_items])
    .where("transactions.result = 'success'")
    .where(invoices: {created_at: date})
    .sum("invoice_items.quantity*CAST(invoice_items.unit_price AS integer)")
    {"total_revenue"=>(revenue/100.0).to_s}
  end

  def self.all_merchants_most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .where("transactions.result = 'success'")
    .group("merchants.id")
    .order("sum (invoice_items.quantity*CAST(invoice_items.unit_price AS integer)) DESC")
    .limit(quantity)
  end

  def favorite_customer
    customers.joins(invoices: [:transactions])
    .where("transactions.result = 'success'")
    .select("customers.id, customers.first_name, customers.last_name, count(transactions.id) AS favorites")
    .group('customers.id')
    .order('favorites DESC')
    .limit(1).take
  end

  def method_name

  end

end
