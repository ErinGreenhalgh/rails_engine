class AddSecondReferenceToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :transaction, foreign_key: true
  end
end
