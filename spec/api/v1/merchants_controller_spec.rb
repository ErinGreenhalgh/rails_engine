require "rails_helper"

RSpec.describe "merchants controller" do
  fixtures :merchants
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
end
