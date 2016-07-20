namespace :all_data do
  describe "loads data from all of the csvs"
  task import: :environment do
    puts "Importing all data..."

    puts "Customers importing..."
    CSV.foreach('./db/csv_data/customers.csv', headers: true) do |row|
      Customer.create!(row.to_h)
    end
    puts "Customers imported."

    puts "Merchants importing..."
    CSV.foreach('./db/csv_data/merchants.csv', headers: true) do |row|
      Merchant.create!(row.to_h)
    end
    puts "Merchants imported."

    puts "Items importing..."
    CSV.foreach('./db/csv_data/items.csv', headers: true) do |row|
      Item.create!(row.to_h)
    end
    puts "Items imported."

    puts "Invoices importing..."
    CSV.foreach('./db/csv_data/invoices.csv', headers: true) do |row|
      Invoice.create!(row.to_h)
    end
    puts "Invoices imported."

    puts "Transactions importing..."
    CSV.foreach('./db/csv_data/transactions.csv', headers: true) do |row|
      Transaction.create!(row.to_h)
    end
    puts "Transactions imported."

    puts "Invoice Items importing..."
    CSV.foreach('./db/csv_data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create!(row.to_h)
    end
    puts "Invoice Items imported."

    puts "All data successfully imported."
  end
end
