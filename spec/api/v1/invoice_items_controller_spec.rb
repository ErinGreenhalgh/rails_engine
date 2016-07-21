require "rails_helper"

RSpec.describe "invoice_items" do
  fixtures :invoice_items, :items, :invoices
  fixtures :items, :invoice_items, :merchants
  scenario "displays all invoice items" do
    get "/api/v1/invoice_items"

    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq 5
  end

  scenario "displays one invoice" do
    invoice_item = invoice_items(:one)

    get "/api/v1/invoice_items/#{invoice_item.id}"
    assert_response :success

    parsed_data = JSON.parse(response.body)

    expect(parsed_data.first).to eq(["id", 980190962])
  end

  scenario "finds the associated item for the record" do
    invoice_item = invoice_items(:one)
    item = items(:one)
    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    assert_response :success
    parsed_item = JSON.parse(response.body)

    expect(parsed_item["name"]).to eq item.name
  end

  scenario "finds the associated invoice for the record" do
    invoice_item = invoice_items(:one)
    invoice = invoices(:one)
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    assert_response :success
    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice["id"]).to eq invoice_item.invoice_id
    expect(parsed_invoice["status"]).to eq invoice.status
  end

end
