class Api::V1::CustomersController < ApplicationController
  def show
    render json: Customer.find(params[:id])
  end

  def index
    render json: Customer.all
  end

  def invoices
    render json: customer.invoices
  end

  def transactions
    render json: customer.transactions
  end

  private

  def customer
    Customer.find(params[:customer_id])
  end
end
