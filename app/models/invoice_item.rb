class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  default_scope -> { order(:id) }

  def self.random
    unscope(:order).order("RANDOM()").limit(1).take
  end
end
