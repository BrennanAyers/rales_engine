class Api::V1::Invoices::CustomerController < ApplicationController
  def index
    render json: CustomerSerializer.new(Customer.joins(:invoices).where(invoices: {id: params[:id]}).take)
  end
end
