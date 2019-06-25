require 'csv'

namespace :import do
  desc "Imports Transactions records from CSV in db/csv"
  task transactions: :environment do
    file = CSV.table("./db/csv/transactions.csv", options = Hash.new)
    transaction_count = file.count
    index = 0
    file.each do |transaction|
      index += 1
      print "#{index}/#{transaction_count} ".light_blue
      if Transactions.create(transaction.to_h)
        puts "Transaction #{transaction[:id]}".green
      else
        puts "Transaction #{transaction[:id]} was unable to be saved".red
      end
    end
  end
end
