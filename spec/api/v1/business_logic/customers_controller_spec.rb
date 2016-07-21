require "rails_helper"

RSpec.describe "customers controller" do
  fixtures :customers, :merchants, :transactions, :invoices
  scenario "finds the favorite merchant for a customer" do
    customer = customers(:one)
    merchant = merchants(:one)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    assert_response :success

    response_merchant = JSON.parse(response.body)

    expect(response_merchant["name"]).to eq merchant.name
  end
end
