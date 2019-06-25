require 'csv'

namespace :import do
  desc "Imports Customer records from CSV in db/csv"
  task customers: :environment do
    file = CSV.table("./db/csv/customers.csv", options = Hash.new)
    customer_count = file.count
    index = 1
    file.each do |customer|
      p "#{index}/#{customer_count}"
      if Customer.create(customer)
        puts "#{customer.name}".green
      else
        puts "#{customer.name} was unable to be saved".red
      end
    end
  end
end
