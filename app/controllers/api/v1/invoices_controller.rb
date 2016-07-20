class Api::V1::InvoicesController < ApplicationController

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(invoice_params[:id])
  end

  private

  def invoice_params
    params.permit(:status, :customer_id, :id, :created_at, :updated_at, :merchant_id)
  end
end
