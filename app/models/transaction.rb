class Transaction < ApplicationRecord
  belongs_to :invoice

  default_scope -> { order(:id) }
  scope :successful, -> { unscope(:order).where result: "success"}
end
