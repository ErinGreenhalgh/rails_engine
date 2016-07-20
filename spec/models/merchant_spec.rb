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

  # it "gets list of customers with pending invoices" do
  #   merchant = merchants(:one)
  #   customer = customers(:one)
  #   transaction = transactions(:two)
  #
  #   fav_customer = merchant.favorite_customer
  #
  #   expect(fav_customer).to eq(customer)
  # end
end
