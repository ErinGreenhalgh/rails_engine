require "rails_helper"

RSpec.describe "merchants controller" do
  scenario "returns total revenue for a merchant across all transactions" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)

    transaction1 = create(:transaction, result: "success", invoice: invoice1)
    transaction1 = create(:transaction, result: "failed", invoice: invoice2)

    invoice_item1 = create(:invoice_item, invoice: invoice1)
    invoice_item2 = create(:invoice_item, invoice: invoice1)
    invoice_item3 = create(:invoice_item, invoice: invoice2)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    assert_response :success

    response_revenue = JSON.parse(response.body)


  end
end
