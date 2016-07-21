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
    transaction2 = create(:transaction, result: "failed", invoice: invoice2)

    invoice_item1 = create(:invoice_item, invoice: invoice1)
    invoice_item2 = create(:invoice_item, invoice: invoice1)
    invoice_item3 = create(:invoice_item, invoice: invoice2)

    expect(merchant.total_revenue).to eq ({"revenue" => "2.0"})
  end

  scenario "finds a variable number of top merchants by items sold" do
    merchant1 = merchants(:one)
    merchant2 = merchants(:two)

    expect(Merchant.most_items(2).last).to eq merchant1
    expect(Merchant.most_items(1).first).to eq merchant2
  end

  it "gets list of customers with pending invoices" do
    merchant = merchants(:one)
    customer = customers(:one)
    transaction = transactions(:two)

    customer_pending_invoice = merchant.customers_pending_invoices.first

    expect(customer_pending_invoice).to eq(customer)
  end

  it "gets total revenue for given date accross all merchants" do
    invoice = invoices(:one)
    total_revenue = Merchant.revenue_for_date_accross_all_merchants(invoice.created_at)

    expect(total_revenue).to eq("total_revenue" => "8.0")
  end

  it "gets specified amount of merchants with most revenue" do
    merchant = merchants(:one)
    merchant2 = merchants(:two)

    top_merchants = Merchant.all_merchants_most_revenue(2)

    expect(top_merchants.first).to eq(merchant)
    expect(top_merchants.last).to eq(merchant2)
  end

  it "gets favorite_customer" do
    merchant = merchants(:one)
    customer = customers(:one)
    favorite = merchant.favorite_customer

    expect(favorite).to eq(customer)
  end

  it "gets the total revenue for a merchant on a given date" do
    merchant = merchants(:one)
    invoice = invoices(:one)
    invoice_item = invoice_items(:one)

    date = "2012-03-27 14:53:59"

    expect(merchant.total_revenue_for_date(date)).to eq ({"revenue" => "8.0"})
  end
end
