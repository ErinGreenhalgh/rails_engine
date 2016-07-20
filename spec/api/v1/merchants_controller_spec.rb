require "rails_helper"

RSpec.describe "merchants controller" do
  fixtures :merchants, :items, :invoices, :customers
  scenario "shows all merchants" do
    get '/api/v1/merchants'

    assert_response :success

    merchants = JSON.parse(body)

    assert_equal 2, merchants.count
  end

  scenario "shows on merchant" do
    merchant = merchants(:one)

    get "/api/v1/merchants/#{merchant.id}"

    assert_response :success

    response_merchant = JSON.parse(response.body)

    assert_equal merchant.name, response_merchant["name"]
  end

  scenario "finds items associated with one merchant" do
    merchant = merchants(:one)
    item     = items(:one)

    get "/api/v1/merchants/#{merchant.id}/items"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq(2)
    expect(parsed_data.first['name']).to eq(item.name)
  end

  scenario "finds invoices associated with one merchant" do
    merchant = merchants(:one)
    invoice  = invoices(:one)

    get "/api/v1/merchants/#{merchant.id}/invoices"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.count).to eq(2)
    expect(parsed_data.first['status']).to eq(invoice.status)
  end

  scenario "gets customers associated w/ merchant w/ pending invoices" do
    merchant         = merchants(:one)
    pending_customer = customers(:one)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    assert_response :success
    parsed_data = JSON.parse(response.body)

    expect(parsed_data.first['first_name']).to eq(pending_customer.first_name)
  end
end
