require 'csv'

namespace :import do
  desc "Imports Items records from CSV in db/csv"
  task items: :environment do
    file = CSV.table("./db/csv/items.csv", options = Hash.new)
    item_count = file.count
    index = 0
    file.each do |item|
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
