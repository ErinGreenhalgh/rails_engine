require "csv"

namespace :merchants do
  desc "imports merchant data into the database"
  task import: :environment do
    puts "Merchants importing..."
    CSV.foreach('./db/csv_data/merchants.csv', headers: true) do |row|
      Merchant.create!(row.to_h)
    end
    puts "Merchants imported."
  end
end
