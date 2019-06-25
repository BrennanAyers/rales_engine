require 'csv'

namespace :import do
  desc "Imports Transactions records from CSV in db/csv"
  task transactions: :environment do
    file = CSV.table("./db/csv/transactions.csv", options = Hash.new)
    transaction_count = file.count
    index = 1
    file.each do |transaction|
      p "#{index}/#{transaction_count}"
      if Transactions.create(transaction)
        puts "Transaction #{transaction.id}".green
      else
        puts "Transaction #{transaction.id} was unable to be saved".red
      end
    end
  end
end
