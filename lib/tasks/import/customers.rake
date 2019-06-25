require 'csv'

namespace :import do
  desc "Imports Customer records from CSV in db/csv"
  task customers: :environment do
    customer_count = 0
    CSV.foreach("./db/csv/customers.csv", headers: true) {|row| customer_count += 1 }
    index = 0
    CSV.foreach("./db/csv/customers.csv", headers: true) do |customer|
      index += 1
      print "#{index}/#{customer_count} ".light_blue
      if Customer.create(customer.to_h)
        puts "#{customer["first_name"] + " " + customer["last_name"]}".green
      else
        puts "#{customer["first_name"] + " " + customer["last_name"]} was unable to be saved".red
      end
    end
  end
end
