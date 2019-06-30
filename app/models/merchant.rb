class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  default_scope -> { order(:id)}

  def self.most_revenue(amount = nil)
    unscoped.joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .merge(Transaction.successful)
    .group("merchants.id")
    .order("revenue DESC")
    .limit(amount)
  end

  def self.most_items(amount = nil)
    unscoped.joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM (invoice_items.quantity) AS items_sold")
    .merge(Transaction.successful)
    .group("merchants.id")
    .order("items_sold DESC")
    .limit(amount)
  end

  def self.revenue(date = nil)
    date = Date.today.to_s if date == nil
    unscoped.joins(invoices: [:invoice_items, :transactions])
    .where("CAST (invoices.updated_at AS DATE) = '#{Date.parse(date)}'")
    .merge(Transaction.successful)
    .select("SUM (invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .take
  end

  def revenue(date = nil)
    total_revenue = invoices.joins(:invoice_items, :transactions)
    .merge(Transaction.successful)
    .select("SUM (invoice_items.quantity * invoice_items.unit_price) AS revenue")

    if date != nil
      total_revenue = total_revenue.where("CAST (invoices.updated_at AS DATE) = '#{Date.parse(date)}'")
    end

    total_revenue.take
  end

  def favorite_customer
    Customer.joins(invoices: [:transactions, :merchant])
    .merge(Transaction.successful)
    .where("invoices.merchant_id = #{self.id}")
    .select("customers.*, COUNT (invoices.id) AS invoice_count")
    .group(:id)
    .order("invoice_count DESC")
    .limit(1).take
  end
end
