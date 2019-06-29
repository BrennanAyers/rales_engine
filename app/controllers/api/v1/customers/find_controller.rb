class Api::V1::Customers::FindController < ApplicationController
  def show
    finders = [:id, :first_name, :last_name, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    merchant = Customer.find_by(first_finder => params[first_finder])
    render json: CustomerSerializer.new(merchant)
  end
end
