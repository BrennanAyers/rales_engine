class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity

  attribute :unit_price do |object|
    "#{('%.2f' % object.unit_price.fdiv(100))}"
  end
end
