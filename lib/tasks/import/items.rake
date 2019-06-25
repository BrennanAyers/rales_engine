require 'csv'

namespace :import do
  desc "Imports Items records from CSV in db/csv"
  task items: :environment do
    item_count = 0
    CSV.foreach("./db/csv/items.csv", headers: true) {|row| item_count += 1 }
    index = 0
    CSV.foreach("./db/csv/items.csv", headers: true) do |item|
      index += 1
      print "#{index}/#{item_count} ".light_blue
      if Item.create(item.to_h)
        puts "#{item[:name]}".green
      else
        puts "#{item[:name]} was unable to be saved".red
      end
    end
  end
end
