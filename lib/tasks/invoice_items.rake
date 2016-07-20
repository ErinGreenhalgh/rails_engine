require "csv"

namespace :invoice_items do
  desc "imports invoice item data into the database"
  task import: :environment do
    puts "Invoice Items importing..."
    CSV.foreach('./db/csv_data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create!(row.to_h)
    end
    puts "Invoice Items imported."
  end
end
