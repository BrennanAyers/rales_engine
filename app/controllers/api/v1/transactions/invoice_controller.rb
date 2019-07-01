class Api::V1::Transactions::InvoiceController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.joins(:transactions).where(transactions: {id: params[:id]}).take)
  end
end
