require "rails_helper"

RSpec.describe "invoices controller" do
  fixtures :invoices, :transactions
  scenario "finds one invoice's transactions" do
    invoice     = invoices(:one)
    transaction = transactions(:one)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to  eq(2)
  end
end
