class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  default_scope -> { order(:id)}

  def self.random
    unscope(:order).order("RANDOM()").limit(1).take
  end
end
