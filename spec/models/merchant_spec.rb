require 'rails_helper'

RSpec.describe Merchant, type: :model do
  scenario "finds the total revenue for a specifc merchant across all transactions" do
    # merchant = create(:merchant)
    # invoice1 = create(:invoice)
    # invoice2 = create(:invoice)
    # transaction1 = create(:transaction, result: "success", invoice: invoice1)
    # transaction1 = create(:transaction, result: "failed", invoice: invoice2)
    # invoice_item = create(:invoice_item)

    expect(merchant.total_revenue).to eq 100
  end
end
