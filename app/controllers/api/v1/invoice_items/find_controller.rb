class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItem.find_by(invoice_items_params)
  end

  def index
    render json: InvoiceItem.where(invoice_items_params)
  end

  def random
    render json: InvoiceItem.random
  end

  private

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
