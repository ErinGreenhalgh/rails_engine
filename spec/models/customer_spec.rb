require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers, :transactions, :invoices, :merchants

  it { should have_many :invoices }
  it { should have_many :transactions }
  it { should have_many :merchants }
  
  scenario "finds the favorite merchant for a customer" do
    customer = customers(:one)
    merchant = merchants(:one)

    expect(customer.favorite_merchant).to eq merchant
  end
end
