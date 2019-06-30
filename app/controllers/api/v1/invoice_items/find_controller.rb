class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    finders = [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    if first_finder == :unit_price
      merchant = InvoiceItem.find_by(first_finder => (params[first_finder].to_f * 100).round)
    else
      merchant = InvoiceItem.find_by(first_finder => params[first_finder])
    end
    render json: InvoiceItemSerializer.new(merchant)
  end
end
