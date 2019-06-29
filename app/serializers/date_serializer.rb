class DateSerializer
  include FastJsonapi::ObjectSerializer
  attribute :date do |object|
    Date.parse(object.updated_at.to_s).to_s
  end
end
