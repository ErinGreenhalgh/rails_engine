require "rails_helper"

RSpec.describe "customers::find controller" do
  fixtures :customers
  context "finds one instance of customer" do
    scenario "by id" do
      customer = customers(:one)
      get "/api/v1/customers/find?id=#{customer.id}"

      assert_response :success
      response_customer = JSON.parse(response.body)

      expect(customer.id).to eq response_customer["id"]
      expect(customer.last_name).to eq response_customer["last_name"]
    end

    scenario "by first name" do
      customer = customers(:one)
      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      assert_response :success
      response_customer = JSON.parse(response.body)

      expect(customer.first_name).to eq response_customer["first_name"]
      expect(customer.last_name).to eq response_customer["last_name"]
    end

    scenario "by last name" do
      customer = customers(:one)
      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      assert_response :success
      response_customer = JSON.parse(response.body)

      expect(customer.id).to eq response_customer["id"]
      expect(customer.last_name).to eq response_customer["last_name"]
    end

    scenario "by created at" do
      customer = customers(:one)
      get "/api/v1/customers/find?created_at=#{customer.created_at}"

      assert_response :success
      response_customer = JSON.parse(response.body)

      expect(customer.id).to eq response_customer["id"]
      expect(customer.last_name).to eq response_customer["last_name"]
    end

    scenario "by updated at" do
      customer = customers(:one)
      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

      assert_response :success
      response_customer = JSON.parse(response.body)

      expect(customer.id).to eq response_customer["id"]
      expect(customer.last_name).to eq response_customer["last_name"]
    end
  end

  context "finds all matching records" do
    scenario "by id" do
      customer = customers(:one)
      get "/api/v1/customers/find_all?id=#{customer.id}"

      assert_response :success
      data = JSON.parse(response.body)

      expect(customer.id).to eq data.first["id"]
      expect(customer.last_name).to eq data.first["last_name"]
    end

    scenario "by first name" do
      customer = customers(:one)
      get "/api/v1/customers/find_all?first_name=#{customer.first_name}"

      assert_response :success
      data = JSON.parse(response.body)

      expect(customer.first_name).to eq data.first["first_name"]
      expect(customer.last_name).to eq data.first["last_name"]
    end

    scenario "by last name" do
      customer = customers(:one)
      get "/api/v1/customers/find_all?last_name=#{customer.last_name}"

      assert_response :success
      data = JSON.parse(response.body)

      expect(customer.id).to eq data.first["id"]
      expect(customer.last_name).to eq data.first["last_name"]
    end

    scenario "by created at" do
      customer = customers(:one)
      get "/api/v1/customers/find_all?created_at=#{customer.created_at}"

      assert_response :success
      data = JSON.parse(response.body)

      expect(customer.id).to eq data.first["id"]
      expect(customer.last_name).to eq data.first["last_name"]
    end

    scenario "by updated at" do
      customer = customers(:one)
      get "/api/v1/customers/find_all?updated_at=#{customer.updated_at}"

      assert_response :success
      data = JSON.parse(response.body)

      expect(customer.id).to eq data.first["id"]
      expect(customer.last_name).to eq data.first["last_name"]
    end
  end
end
