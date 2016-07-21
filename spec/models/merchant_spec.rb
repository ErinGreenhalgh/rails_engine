require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices, :items, :invoice_items, :transactions

  # scenario "finds the total revenue for a specifc merchant across all transactions" do
  #   merchant = create(:merchant)
  #   invoice1 = create(:invoice, merchant: merchant)
  #   invoice2 = create(:invoice, merchant: merchant)
  #
  #   transaction1 = create(:transaction, result: "success", invoice: invoice1)
  #   transaction1 = create(:transaction, result: "failed", invoice: invoice2)
  #
  #   invoice_item1 = create(:invoice_item, invoice: invoice1)
  #   invoice_item2 = create(:invoice_item, invoice: invoice1)
  #   invoice_item3 = create(:invoice_item, invoice: invoice2)
  #
  #   expect(merchant.total_revenue).to eq 200
  # end

  scenario "finds a variable number of top merchants by items sold" do
    # merchant1 = create(:merchant)
    # merchant2 = create(:merchant)
    # merchant3 = create(:merchant)
    #
    # invoice1 = create(:invoice, merchant: merchant1)
    # invoice2 = create(:invoice, merchant: merchant2)
    #
    # transaction1 = create(:transaction, invoice: invoice1)
    # transaction2 = create(:transaction, invoice: invoice2)
    #
    # invoice_item1 = create(:invoice_item, invoice: invoice1)
    # invoice_item2 = create(:invoice_item, invoice: invoice1)
    # invoice_item3 = create(:invoice_item, invoice: invoice2)

    merchant1 = merchants(:one)
    merchant2 = merchants(:two)
    merchant3 = merchants(:three)


    # invoice1 = invoices(:one)
    # invoice2 = invoices(:two)


    byebug
    expect(Merchant.most_items(3).last).to eq merchant3
    expect(Merchant.most_items(1).first).to eq merchant1
  end
end
