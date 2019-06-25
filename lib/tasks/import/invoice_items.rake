require 'csv'

namespace :import do
  desc "Imports InvoiceItems records from CSV in db/csv"
  task invoice_items: :environment do
    file = CSV.table("./db/csv/invoice_items.csv", options = Hash.new)
    invoice_item_count = file.count
    index = 0
    file.each do |invoice_item|
      index += 1
      print "#{index}/#{invoice_item_count} ".light_blue
      if InvoiceItems.create(invoice_item.to_h)
        puts "Invoice Item #{invoice_item[:id]}".green
      else
        puts "Invoice Item #{invoice_item[:id]} was unable to be saved".red
      end
    end
  end
end
