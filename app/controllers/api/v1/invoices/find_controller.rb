class Api::V1::Ivoices::FindController < ApplicationController
  def index
    respond_with Invoice.where(invoice_items_params)
  end

  def show
    respond_with Invoice.find_by(invoice_items_params)
  end

  private

  def invoice_params
    params.permit(:status, :customer_id, :id, :created_at, :updated_at, :merchant_id)
  end
end
