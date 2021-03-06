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

  def revenue
    if params[:date]
      render json: merchant.total_revenue_for_date(params[:date])
    else
      render json: merchant.total_revenue
    end
  end

  def pending_customers
    render json: merchant.customers_pending_invoices
  end

  def fav_customer
    render json: merchant.favorite_customer
  end

  def most_items
    render json: Merchant.most_items(params[:quantity])
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end
end
