require 'csv'

namespace :import do
  desc "Imports InvoiceItems records from CSV in db/csv"
  task invoice_items: :environment do
    invoice_item_count = 0
    CSV.foreach("./db/csv/invoice_items.csv", headers: true) {|row| invoice_item_count += 1 }
    index = 0
    CSV.foreach("./db/csv/invoice_items.csv", headers: true) do |invoice_item|
      index += 1
      print "#{index}/#{invoice_item_count} ".light_blue
      if InvoiceItem.create(invoice_item.to_h)
        puts "Invoice Item #{invoice_item["id"]}".green
      else
        puts "Invoice Item #{invoice_item["id"]} was unable to be saved".red
      end
    end
  end
end
