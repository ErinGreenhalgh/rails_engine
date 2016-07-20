class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def customers_pending_invoices
    self.customers.
        where("invoices.status = 'pending'")
  end
end
