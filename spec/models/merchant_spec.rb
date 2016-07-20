require 'rails_helper'

RSpec.describe Merchant, type: :model do
  scenario "finds the total revenue for a specifc merchant across all transactions" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)

    transaction1 = create(:transaction, result: "success", invoice: invoice1)
    transaction1 = create(:transaction, result: "failed", invoice: invoice2)

    invoice_item1 = create(:invoice_item, invoice: invoice1)
    invoice_item2 = create(:invoice_item, invoice: invoice1)
    invoice_item3 = create(:invoice_item, invoice: invoice2)

    expect(merchant.total_revenue).to eq 200
  end
end
