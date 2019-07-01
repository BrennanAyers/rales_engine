class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Invoice.joins(:transactions).where(customer_id: params[:id]).select(" transactions.*"))
  end
end
