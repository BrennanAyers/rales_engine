class Api::V1::Transactions::FindController < ApplicationController
  def show
    finders = [:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    transaction = Transaction.find_by(first_finder => params[first_finder])
    render json: TransactionSerializer.new(transaction)
  end
end
