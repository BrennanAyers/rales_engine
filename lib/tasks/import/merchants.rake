require 'csv'

namespace :import do
  desc "Imports Merchant records from CSV in db/csv"
  task merchants: :environment do
    file = CSV.table("./db/csv/merchants.csv", options = Hash.new)
    merchant_count = file.count
    index = 0
    file.each do |merchant|
      index += 1
      print "#{index}/#{merchant_count} ".light_blue
      if Merchant.create(merchant.to_h)
        puts "#{merchant[:name]}".green
      else
        puts "#{merchant[:name]} was unable to be saved".red
      end
    end
  end
end
