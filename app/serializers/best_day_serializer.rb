class BestDaySerializer
  include FastJsonapi::ObjectSerializer
  attribute :best_day do |object|
    Date.parse(object.updated_at.to_s).to_s
  end
end
