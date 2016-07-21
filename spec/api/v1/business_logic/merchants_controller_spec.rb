require "rails_helper"

RSpec.describe "merchants controller" do
  fixtures :merchants, :invoices, :items, :invoice_items, :transactions
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

    expect(response_revenue).to eq merchant.total_revenue
  end

  scenario "returns the top number of merchants ranked by items sold" do
    merchant1 = merchants(:one)
    merchant2 = merchants(:two)
    quantity = 2

    get "/api/v1/merchants/most_items?quantity=#{quantity}"

    assert_response :success
    data = JSON.parse(response.body)

    expect(data.count).to eq 2
    expect(data.first["name"]).to eq merchant1.name
  end
end
