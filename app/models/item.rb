class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(amount = nil)
    joins(invoices: [:invoice_items, :transactions])
    .select("items.*, SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .merge(Transaction.successful)
    .group("items.id")
    .order("revenue DESC")
    .limit(amount)
  end
end
