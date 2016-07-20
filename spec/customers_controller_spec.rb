require "rails_helper"

RSpec.describe "customers controller" do
  fixtures :customers
  scenario "finds one customer's invoices" do
