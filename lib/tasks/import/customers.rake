require 'csv'

namespace :import do
  desc "Imports Customer records from CSV in db/csv"
  task customers: :environment do
    file = CSV.table("./db/csv/customers.csv", options = Hash.new)
    customer_count = file.count
    index = 0
    file.each do |customer|
      index += 1
      print "#{index}/#{customer_count} ".light_blue
      if Customer.create(customer.to_h)
        puts "#{customer[:first_name] + " " + customer[:last_name]}".green
      else
        puts "#{customer[:first_name] + " " + customer[:last_name]} was unable to be saved".red
      end
    end
  end
end
