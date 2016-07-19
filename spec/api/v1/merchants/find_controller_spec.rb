require "rails_helper"

RSpec.describe "merchants find controller" do
  fixtures :merchants
  context "finds one merchant record" do
    # before(:each) do 
    #   @merchant = merchants(:one)
    #   @response_merchant = JSON.parse(response.body)
    # end

    scenario "by id" do
      merchant = merchants(:one)
      get "/api/v1/merchants/find?id=#{merchant.id}"

      assert_response :success

      response_merchant = JSON.parse(response.body)

      assert_equal merchant.id, response_merchant["id"]
      assert_equal merchant.name, response_merchant["name"]
    end

    scenario "by name" do
      get "/api/v1/merchants/find?name=#{merchant.name}"

    end

    scenario "by created_at" do
      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    end

    scenario "by updated_at" do
      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    end
  end





end
