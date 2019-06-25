require 'csv'

namespace :import do
  desc "Imports Items records from CSV in db/csv"
  task items: :environment do
    file = CSV.table("./db/csv/items.csv", options = Hash.new)
    item_count = file.count
    index = 1
    file.each do |item|
      p "#{index}/#{item_count}"
      if Items.create(item)
        puts "#{item.name}".green
      else
        puts "#{item.name} was unable to be saved".red
      end
    end
  end
end
