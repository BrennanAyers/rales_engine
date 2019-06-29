class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
    if object.revenue.nil?
      "0.00"
    else
      "#{'%.2f' % object.revenue.fdiv(100)}"
    end
  end
end
