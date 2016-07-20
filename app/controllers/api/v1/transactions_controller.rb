class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end

  def invoice
    render json: transaction.invoice
  end

  private

  def transaction
    Transaction.find(params[:transaction_id])
  end
end
