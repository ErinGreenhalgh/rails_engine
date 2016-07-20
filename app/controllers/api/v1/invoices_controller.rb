class Api::V1::InvoicesController < ApplicationController

  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find(params[:id])
  end

  def transactions
    render json: invoice.transactions
  end

  def invoice_items
    render json: invoice.invoice_items
  end

  def items
    render json: invoice.items
  end

  def customer
    render json: invoice.customer
  end

  def merchant
    render json: invoice.merchant
  end

  private

  def invoice
    Invoice.find(params[:invoice_id])
  end

end
