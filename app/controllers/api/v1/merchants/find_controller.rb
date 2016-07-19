class Api::V1::Merchants::FindController < ApplicationController
  def show
    respond_with Merchant.find_by(merchant_params)
  end

private
  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end
