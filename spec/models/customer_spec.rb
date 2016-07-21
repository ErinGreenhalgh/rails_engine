require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers, :transactions, :invoices, :merchants
  scenario "finds the favorite merchant for a customer" do
    customer = customers(:one)
    merchant = merchants(:one)

    expect(customer.favorite_merchant).to eq merchant
  end
end
