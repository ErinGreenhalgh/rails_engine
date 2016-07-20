require "rails_helper"

RSpec.describe "invoice_items" do
  fixtures :invoice_items, :items, :invoices
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
