class Transaction < ApplicationRecord
  belongs_to :invoice

  default_scope -> { order(:id) }
  scope :successful, -> { unscope(:order).where result: "success"}

  def self.random
    unscope(:order).order("RANDOM()").limit(1).take
  end
end
