require "rails_helper"

RSpec.describe "items controller" do
  fixtures :items, :invoice_items, :merchants
  scenario "displays all items" do
    get "/api/v1/items"

    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq 2
  end

  scenario "displays one item" do
    item = items(:one)

    get "/api/v1/invoices/#{item.id}"
    assert_response :success

    parsed_data = JSON.parse(response.body)

    expect(parsed_data.first).to eq(["id", 980190962])
  end

  scenario "finds related invoice items for an item" do
    item = items(:one)
    invoice_item = invoice_items(:one)
    get "/api/v1/items/#{item.id}/invoice_items"

    assert_response :success
    data = JSON.parse(response.body)

    expect(data.first["item_id"]).to eq (item.id)
    expect(invoice_item.quantity).to eq (data.first["quantity"])
    expect(invoice_item.unit_price).to eq (data.first["unit_price"])
  end

  scenario "finds the associated merchant for an item" do
    item = items(:one)
    merchant = merchants(:one)
    get "/api/v1/items/#{item.id}/merchant"

    assert_response :success
    response_merchant = JSON.parse(response.body)

    expect(response_merchant["id"]).to eq item.merchant_id
    expect(merchant.name).to eq response_merchant["name"]
  end


end
