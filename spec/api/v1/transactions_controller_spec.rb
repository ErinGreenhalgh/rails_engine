require "rails_helper"

RSpec.describe "transactions controller" do
  fixtures :transactions
  scenario "finds all transactions" do
    transactions = [transactions(:one), transactions(:two)]

    get '/api/v1/transactions'
    assert_response :success

    response_transactions = JSON.parse(response.body)

    assert_equal 2, response_transactions.count
  end

  scenario "finds one transaction" do
    transaction = transactions(:one)

    get "/api/v1/transactions/#{transaction.id}"
    assert_response :success

    response_transaction = JSON.parse(response.body)

    assert_equal transaction.invoice_id,         response_transaction["invoice_id"]
    assert_equal transaction.credit_card_number, response_transaction["credit_card_number"]
    assert_equal transaction.result,             response_transaction["result"]
  end

  scenario "finds the associated invoice" do
    transaction = transactions(:one)

    get "/api/v1/transactions/#{transaction.id}/invoice"
    assert_response :success
    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice.count).to eq(1)
  end

end
