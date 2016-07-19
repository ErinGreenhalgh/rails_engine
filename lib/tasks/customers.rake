require "csv"

namespace :customers do
  desc "imports customer data into the database"
  task import: :environment do
    puts "Customers importing..."
    CSV.foreach('./db/csv_data/customers.csv', headers: true) do |row|
      Customer.create!(row.to_h)
    end
    puts "Customers imported."
  end
end
