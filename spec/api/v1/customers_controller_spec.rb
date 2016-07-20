require "rails_helper"

RSpec.describe "customers controller" do
  fixtures :customers
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
end
