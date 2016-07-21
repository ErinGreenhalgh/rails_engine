class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

  def item
    render json: invoice_item.item
  end

  def invoice
    render json: invoice_item.invoice
  end

  private
  
  def invoice_item
    InvoiceItem.find(params[:invoice_item_id])
  end

end
