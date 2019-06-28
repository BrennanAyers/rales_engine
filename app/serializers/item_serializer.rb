class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id

  attribute :unit_price do |object|
    "#{'%.2f' % object.unit_price.fdiv(100)}"
  end
end
