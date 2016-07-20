require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices,  :customers
  it "gets list of customers with pending invoices" do
    merchant = merchants(:one)
    invoice  = invoices(:one)
    customer = customers(:one)

    customer_pending_invoice = merchant.customers_pending_invoices.first

    expect(customer_pending_invoice).to eq(customer)
  end
end
