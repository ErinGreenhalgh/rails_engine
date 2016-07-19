require "csv"

namespace :items do
  desc "imports item data into the database"
  task import: :environment do
    puts "Items importing..."
    CSV.foreach('./db/csv_data/items.csv', headers: true) do |row|
      Item.create!(row.to_h)
    end
    puts "Items imported."
  end
end
