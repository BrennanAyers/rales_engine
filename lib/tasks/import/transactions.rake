require 'csv'

namespace :import do
  desc "Imports Transactions records from CSV in db/csv"
  task transactions: :environment do
    transaction_count = 0
    CSV.foreach("./db/csv/transactions.csv", headers: true) {|row| transaction_count += 1 }
    index = 0
    CSV.foreach("./db/csv/transactions.csv", headers: true) do |transaction|
      index += 1
      print "#{index}/#{transaction_count} ".light_blue
      if Transaction.create(transaction.to_h)
        puts "Transaction #{transaction[:id]}".green
      else
        puts "Transaction #{transaction[:id]} was unable to be saved".red
      end
    end
  end
end
