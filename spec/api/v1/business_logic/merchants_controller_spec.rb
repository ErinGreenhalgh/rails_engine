require "rails_helper"

RSpec.describe "merchants controller" do
  scenario "returns total revenue for a merchant across all transactions" do

    get "/api/v1/merchants/#{merchant.id}/revenue"

    assert_response :success

    response_revenue = JSON.parse(response.body)
    
  end
end
