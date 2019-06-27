class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(amount)
    joins(invoices: :invoice_items)
    .select("merchants.*, SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .group("merchants.id")
    .order("revenue DESC")
    .limit(amount)
  end

  def self.most_items(amount)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM (invoice_items.quantity) AS items_sold")
    .merge(Transaction.successful)
    .group("merchants.id")
    .order("items_sold DESC")
    .limit(amount)
  end
end
