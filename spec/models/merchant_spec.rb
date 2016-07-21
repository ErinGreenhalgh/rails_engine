require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants,  :customers, :transactions, :invoices
  it "gets list of customers with pending invoices" do
    merchant = merchants(:one)
    customer = customers(:one)
    transaction = transactions(:two)

    customer_pending_invoice = merchant.customers_pending_invoices.first

    expect(customer_pending_invoice).to eq(customer)
  end

  it "gets total revenue for given date accross all merchants" do
    invoice = invoices(:one)
    total_revenue = Merchant.revenue_for_date_all_merchants(invoice.created_at)
# byebug
    expect(total_revenue).to eq("")
  end
end
