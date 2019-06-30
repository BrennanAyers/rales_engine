class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    finders = [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    if first_finder == :unit_price
      invoice_item = InvoiceItem.find_by(first_finder => (params[first_finder].to_f * 100).round)
    else
      invoice_item = InvoiceItem.find_by(first_finder => params[first_finder])
    end
    render json: InvoiceItemSerializer.new(invoice_item)
  end

  def index
    finders = [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    if first_finder == :unit_price
      invoice_items = InvoiceItem.where(first_finder => (params[first_finder].to_f * 100).round)
    else
      invoice_items = InvoiceItem.where(first_finder => params[first_finder])
    end
    render json: InvoiceItemSerializer.new(invoice_items)
  end
end
