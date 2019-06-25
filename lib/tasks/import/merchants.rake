require 'csv'

namespace :import do
  desc "Imports Merchant records from CSV in db/csv"
  task merchants: :environment do
    merchant_count = 0
    CSV.foreach("./db/csv/merchants.csv", headers: true) {|row| merchant_count += 1 }
    index = 0
    CSV.foreach("./db/csv/merchants.csv", :headers => true) do |merchant|
      index += 1
      print "#{index}/#{merchant_count} ".light_blue
      if Merchant.create(merchant.to_h)
        puts "#{merchant["name"]}".green
      else
        puts "#{merchant["name"]} was unable to be saved".red
      end
    end
  end
end
