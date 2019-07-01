class Customer < ApplicationRecord
  has_many :invoices

  default_scope -> { order(:id)}

  def favorite_merchant
    Merchant.unscope(:order).joins(invoices: [:transactions, :customer])
    .merge(Transaction.successful)
    .where("invoices.customer_id = #{self.id}")
    .select("merchants.*, COUNT (invoices.id) AS invoice_count")
    .group(:id)
    .order("invoice_count DESC")
    .limit(1).take
  end

  def self.random
    unscope(:order).order("RANDOM()").limit(1).take
  end
end
