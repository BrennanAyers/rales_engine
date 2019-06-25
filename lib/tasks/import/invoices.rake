require 'csv'

namespace :import do
  desc "Imports Invoices records from CSV in db/csv"
  task invoices: :environment do
    file = CSV.table("./db/csv/invoices.csv", options = Hash.new)
    invoice_count = file.count
    index = 1
    file.each do |invoice|
      p "#{index}/#{invoice_count}"
      if Invoices.create(invoice)
        puts "Invoice #{invoice.id}".green
      else
        puts "Invoice #{invoice.id} was unable to be saved".red
      end
    end
  end
end
