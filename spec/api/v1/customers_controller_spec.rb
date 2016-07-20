require "rails_helper"

RSpec.describe "customers controller" do
  fixtures :customers, :invoices, :transactions
  scenario "finds all invoices associated with one customer" do
    customer = customers(:one)
    invoice  = invoices(:one)

    get "/api/v1/customers/#{customer.id}/invoices"
    assert_response :success

    parsed_invoices = JSON.parse(response.body)
    expect(parsed_invoices.first['customer_id']).to eq(customer.id)
  end

  scenario "finds all transactions associated with one customer" do
    customer     = customers(:one)
    transaction  = transactions(:one)

    get "/api/v1/customers/#{customer.id}/transactions"
    assert_response :success

    parsed_invoices = JSON.parse(response.body)

    expect(parsed_invoices.first['invoice_id']).to eq(transaction.invoice_id)
  end
end
