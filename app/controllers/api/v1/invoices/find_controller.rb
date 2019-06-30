class Api::V1::Invoices::FindController < ApplicationController
  def show
    finders = [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    invoice = Invoice.find_by(first_finder => params[first_finder])
    render json: InvoiceSerializer.new(invoice)
  end
end
