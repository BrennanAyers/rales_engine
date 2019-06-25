require 'csv'

namespace :import do
  desc "Imports InvoiceItems records from CSV in db/csv"
  task invoice_items: :environment do
    file = CSV.table("./db/csv/invoice_items.csv", options = Hash.new)
    invoice_item_count = file.count
    index = 1
    file.each do |invoice_item|
      p "#{index}/#{invoice_item_count}"
      if InvoiceItems.create(invoice_item)
        puts "Invoice Item #{invoice_item.id}".green
      else
        puts "Invoice Item #{invoice_item.id} was unable to be saved".red
      end
    end
  end
end
