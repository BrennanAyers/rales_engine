require 'csv'

namespace :import do
  desc "Imports Invoices records from CSV in db/csv"
  task invoices: :environment do
    invoice_count = 0
    CSV.foreach("./db/csv/invoices.csv", headers: true) {|row| invoice_count += 1 }
    index = 0
    CSV.foreach("./db/csv/invoices.csv", headers: true) do |invoice|
      index += 1
      print "#{index}/#{invoice_count} ".light_blue
      if Invoice.create(invoice.to_h)
        puts "Invoice #{invoice["id"]}".green
      else
        puts "Invoice #{invoice["id"]} was unable to be saved".red
      end
    end
  end
end
