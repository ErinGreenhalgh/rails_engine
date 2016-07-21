require "rails_helper"

RSpec.describe "transactions::find controller" do
  fixtures :transactions
  context "finds one record" do
    scenario "by id" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?id=#{transaction.id}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end

    scenario "by credit_card_number" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end


    scenario "by invoice_id" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end

    scenario "by result" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?result=#{transaction.result}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end

    scenario "by updated_at" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end

    scenario "by creadted_at" do
      transaction = transactions(:one)
      get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

      assert_response :success

      response_transaction = JSON.parse(response.body)

      expect(transaction.id).to eq(response_transaction["id"])
      expect(transaction.credit_card_number).to eq(response_transaction["credit_card_number"])
      expect(transaction.result).to eq(response_transaction["result"])
    end
  end

  context "finds all matching records" do
    scenario "by id" do
      transaction1 = transactions(:one)
      transaction2 = transactions(:two)
      get "/api/v1/transactions/find_all?id=#{transaction1.id}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 1

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])
    end

    scenario "by credit_card_number" do
      transaction1 = transactions(:one)
      transaction2 = transactions(:two)
      get "/api/v1/transactions/find_all?credit_card_number=#{transaction1.credit_card_number}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 1

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])
    end

    scenario "by invoice_id" do
      transaction1 = transactions(:one)
      get "/api/v1/transactions/find_all?invoice_id=#{transaction1.invoice_id}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 3

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])

    end

    scenario "by result" do
      transaction1 = transactions(:one)
      transaction2 = transactions(:two)
      get "/api/v1/transactions/find_all?result=#{transaction1.result}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 3

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])
    end

    scenario "by created_at" do
      transaction1 = transactions(:one)
      get "/api/v1/transactions/find_all?created_at=#{transaction1.created_at}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 4

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])
    end

    scenario "by updated_at" do
      transaction1 = transactions(:one)
      get "/api/v1/transactions/find_all?updated_at=#{transaction1.updated_at}"

      assert_response :success

      response_transactions = JSON.parse(response.body)

      expect(response_transactions.count).to eq 4

      expect(transaction1.id).to eq(response_transactions.first["id"])
      expect(transaction1.credit_card_number).to eq(response_transactions.first["credit_card_number"])
      expect(transaction1.result).to eq(response_transactions.first["result"])
    end
  end
end
