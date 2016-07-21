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

  def fav_customer
    render json: merchant.favorite_customer
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end
end
