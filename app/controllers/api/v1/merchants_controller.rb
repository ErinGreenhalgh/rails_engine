class Api::V1::MerchantsController < ApplicationController

  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def items
    render json: merchant.items
  end

  def invoices
    render json: merchant.invoices
  end

  def pending_customers
    render json: merchant.customers_pending_invoices
  end

  def revenue_for_date_all_merchants
    render json: Merchant.revenue_for_date_accross_all_merchants(params[:date])
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end
end
