class Api::V1::InvoiceItems::ItemController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.joins(:invoice_items).where(invoice_items: {id: params[:id]}).take)
  end
end
