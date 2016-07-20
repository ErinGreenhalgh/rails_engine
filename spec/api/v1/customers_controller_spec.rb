require "rails_helper"

RSpec.describe "customers controller" do
  fixtures :customers, :invoices, :transactions
  scenario "displays all customers" do
    customer1 = customers(:one)
    customer2 = customers(:two)
    get "/api/v1/customers"

    assert_response :success

    data = JSON.parse(response.body)
    expect(data.count).to eq 2
  end

  scenario "displays one customer" do
    customer = customers(:one)
    get "/api/v1/customers/#{customer.id}"
    assert_response :success

    response_customer = JSON.parse(response.body)

    expect(customer.first_name).to eq response_customer["first_name"]
    expect(customer.last_name).to eq response_customer["last_name"]
  end 

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
