require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices, :items, :invoice_items, :transactions, :customers

  it { should have_many :items }
  it { should have_many :invoices }
  it { should have_many :invoice_items }
  it { should have_many :customers }
  it { should have_many :transactions }

  scenario "finds the total revenue for a specifc merchant across all transactions" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)

    transaction1 = create(:transaction, result: "success", invoice: invoice1)
    transaction1 = create(:transaction, result: "failed", invoice: invoice2)

    invoice_item1 = create(:invoice_item, invoice: invoice1)
    invoice_item2 = create(:invoice_item, invoice: invoice1)
    invoice_item3 = create(:invoice_item, invoice: invoice2)

    expect(merchant.total_revenue).to eq ({"revenue" => "2.0"})
  end

  scenario "finds a variable number of top merchants by items sold" do
    merchant1 = merchants(:one)
    merchant2 = merchants(:two)

    expect(Merchant.most_items(2).last).to eq merchant2
    expect(Merchant.most_items(1).first).to eq merchant1
  end

  it "gets list of customers with pending invoices" do
    merchant = merchants(:one)
    customer = customers(:one)
    transaction = transactions(:two)

    customer_pending_invoice = merchant.customers_pending_invoices.first

    expect(customer_pending_invoice).to eq(customer)
  end
end
