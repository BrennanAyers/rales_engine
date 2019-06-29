class TotalRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :total_revenue do |object|
    if object.total_revenue.nil?
      "0.00"
    else
      "#{'%.2f' % object.total_revenue.fdiv(100)}"
    end
  end
end
