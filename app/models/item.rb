class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> { order(:id)}

  def self.most_revenue(amount = nil)
    unscope(:order).joins(invoices: :transactions)
    .select("items.*, SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .merge(Transaction.successful)
    .group("items.id")
    .order("revenue DESC")
    .limit(amount)
  end

  def self.most_items(amount = nil)
    unscope(:order).joins(invoices: :transactions)
    .select("items.*, SUM (invoice_items.quantity) AS items_sold")
    .merge(Transaction.successful)
    .group("items.id")
    .order("items_sold DESC")
    .limit(amount)
  end

  def best_day
    invoices.unscope(:order).joins(:transactions)
    .merge(Transaction.successful)
    .select("invoices.updated_at, SUM (invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .group(:updated_at)
    .order("total_revenue DESC, updated_at DESC")
    .limit(1).take
  end

  def self.random
    unscope(:order).order("RANDOM()").limit(1).take
  end
end
