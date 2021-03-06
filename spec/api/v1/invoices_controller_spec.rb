require "rails_helper"

RSpec.describe "invoices controller" do
  fixtures :invoices, :transactions, :items, :invoice_items, :customers, :merchants
  scenario "displays all invoices" do

    get "/api/v1/invoices"

    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq 3
  end

  scenario "displays one invoice" do
    invoice = invoices(:one)

    get "/api/v1/invoices/#{invoice.id}"
    assert_response :success

    parsed_data = JSON.parse(response.body)

    expect(parsed_data.first).to eq(["id", 980190962])
  end

  scenario "finds one invoice's transactions" do
    invoice     = invoices(:one)
    transaction = transactions(:one)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to  eq(3)
    expect(parsed_data.first['invoice_id']).to  eq(transaction.invoice_id)
  end

  scenario "finds invoice items for an invoice" do
    invoice = invoices(:one)
    invoice_item = invoice_items(:one)
    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    assert_response :success

    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq 4
    expect(parsed_data.first["quantity"]).to eq invoice_item.quantity
    expect(parsed_data.first["unit_price"]).to eq invoice_item.unit_price
   end

  scenario "finds items for an invoice" do
    invoice = invoices(:one)
    item    = items(:one)
    get "/api/v1/invoices/#{invoice.id}/items"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq 4
    expect(parsed_data.first["name"]).to eq item.name
    expect(parsed_data.first["description"]).to eq item.description
  end

  scenario "finds the customer for an invoice" do
    invoice = invoices(:one)
    customer = customers(:one)
    get "/api/v1/invoices/#{invoice.id}/customer"
    assert_response :success
    parsed_customer = JSON.parse(response.body)

    expect(parsed_customer["first_name"]).to eq customer.first_name
    expect(parsed_customer["last_name"]).to eq customer.last_name
  end

  scenario "finds the merchant for an invoice" do
    invoice = invoices(:one)
    merchant = merchants(:one)
    get "/api/v1/invoices/#{invoice.id}/merchant"
    assert_response :success
    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant["name"]).to eq merchant.name
  end
end
