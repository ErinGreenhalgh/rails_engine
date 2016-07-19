class Api::V1::InvoicesController < ApplicationController

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def transactions
    respond_with Invoice.find(params[:invoice_id]).transactions
  end
end
