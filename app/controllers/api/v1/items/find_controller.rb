class Api::V1::Items::FindController < ApplicationController
  def show
    finders = [:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    if first_finder == :unit_price
      item = Item.find_by(first_finder => (params[first_finder].to_f * 100).round)
    else
      item = Item.find_by(first_finder => params[first_finder])
    end
    render json: ItemSerializer.new(item)
  end

  def index
    finders = [:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    if first_finder == :unit_price
      items = Item.where(first_finder => (params[first_finder].to_f * 100).round)
    else
      items = Item.where(first_finder => params[first_finder])
    end
    render json: ItemSerializer.new(items)
  end
end
