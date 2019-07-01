class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.joins(:invoice_items).where(invoice_items: {id: params[:id]}).take)
  end
end
