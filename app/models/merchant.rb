class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(amount = nil)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .merge(Transaction.successful)
    .group("merchants.id")
    .order("revenue DESC")
    .limit(amount)
  end

  def self.most_items(amount = nil)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM (invoice_items.quantity) AS items_sold")
    .merge(Transaction.successful)
    .group("merchants.id")
    .order("items_sold DESC")
    .limit(amount)
  end
end
