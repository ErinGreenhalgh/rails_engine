require "rails_helper"

RSpec.describe "merchants find controller" do
  fixtures :merchants
  context "finds one merchant record" do

    scenario "by id" do
      merchant = merchants(:one)
      get "/api/v1/merchants/find?id=#{merchant.id}"

      assert_response :success

      response_merchant = JSON.parse(response.body)

      assert_equal merchant.id, response_merchant["id"]
      assert_equal merchant.name, response_merchant["name"]
    end

    scenario "by name" do
      merchant = merchants(:one)
      get "/api/v1/merchants/find?name=#{merchant.name}"

      assert_response :success

      response_merchant = JSON.parse(response.body)

      assert_equal merchant.id, response_merchant["id"]
      assert_equal merchant.name, response_merchant["name"]
    end

    scenario "by created_at" do
      merchant = merchants(:one)
      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      assert_response :success

      response_merchant = JSON.parse(response.body)

      assert_equal merchant.id, response_merchant["id"]
      assert_equal merchant.name, response_merchant["name"]
    end

    scenario "by updated_at" do
      merchant = merchants(:one)
      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      assert_response :success
      response_merchant = JSON.parse(response.body)

      assert_equal merchant.id, response_merchant["id"]
      assert_equal merchant.name, response_merchant["name"]
    end
  end

  context "finds all matching merchant records" do
    scenario "by id" do
      merchant1 = merchants(:one)
      merchant2 = merchants(:two)

      get "/api/v1/merchants/find_all?id=#{merchant1.id}"
      assert_response :success
      data = JSON.parse(response.body)
      assert_equal merchant1.id, data.first["id"]
      assert_equal merchant1.name, data.first["name"]
    end

    scenario "by name" do
      merchant1 = merchants(:one)
      merchant2 = merchants(:two)

      get "/api/v1/merchants/find_all?name=#{merchant1.name}"
      assert_response :success
      data = JSON.parse(response.body)
      assert_equal merchant1.id, data.first["id"]
      assert_equal merchant1.name, data.first["name"]
    end

    scenario "by created_at" do
      merchant1 = merchants(:one)

      get "/api/v1/merchants/find_all?created_at=#{merchant1.created_at}"
      assert_response :success
      data = JSON.parse(response.body)
      assert merchant1.id, data.first["id"]
      assert merchant1.name, data.first["name"]
    end

    scenario "by updated_at" do
      merchant1 = merchants(:one)

      get "/api/v1/merchants/find_all?updated_at=#{merchant1.updated_at}"
      assert_response :success
      data = JSON.parse(response.body)
      assert_equal merchant1.id, data.first["id"]
      assert_equal merchant1.name, data.first["name"]

    end
  end

end
