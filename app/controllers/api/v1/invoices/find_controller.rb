class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  def random
    render json: Invoice.random
  end

  private

  def invoice_params
    params.permit(:status, :customer_id, :id, :created_at, :updated_at, :merchant_id)
  end
end
