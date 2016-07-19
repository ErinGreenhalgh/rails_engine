class Api::V1::Customers::FindController < ApplicationController
  def show
    respond_with Customer.find_by(customer_params)
  end

  def index
    respond_with Customer.where(customer_params)
  end

private
  def customer_params
    params.permit(:first_name, :last_name, :id, :created_at, :updated_at)
  end
end
