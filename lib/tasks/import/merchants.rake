require 'csv'

namespace :import do
  desc "Imports Merchant records from CSV in db/csv"
  task merchants: :environment do
    file = CSV.table("./db/csv/merchants.csv", options = Hash.new)
    merchant_count = file.count
    index = 1
    file.each do |merchant|
      p "#{index}/#{merchant_count}"
      if Merchant.create(merchant)
        puts "#{merchant.name}".green
      else
        puts "#{merchant.name} was unable to be saved".red
      end
    end
  end
end
