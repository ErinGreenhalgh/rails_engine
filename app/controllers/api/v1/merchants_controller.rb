class Api::V1::MerchantsController < ApplicationController
  def show
    respond_with Merchant.find(params[:id])
  end

end
