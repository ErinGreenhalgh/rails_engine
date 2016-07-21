class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: Merchant.find_by(merchant_params)
  end

  def index
    render json: Merchant.where(merchant_params)
  end

  def revenue_for_date_all_merchants
    render json: Merchant.revenue_for_date_accross_all_merchants(params[:date])
  end

  def merchants_most_revenue
    render json: Merchant.all_merchants_most_revenue(params[:quantity])
  end

  def fav_customer

  end

private

  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end
