require "csv"

namespace :invoices do
  desc "imports invoice data into the database"
  task import: :environment do
    puts "Invoices importing..."
    CSV.foreach('./db/csv_data/invoices.csv', headers: true) do |row|
      Invoice.create!(row.to_h)
    end
    puts "Invoices imported."
  end
end
