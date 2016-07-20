require 'rails_helper'
require 'load_csv'
require 'csv'

RSpec.describe "load_csv" do
  scenario "creates objects from CSV data" do
    file_name = "merchants"
    model = Merchant

    LoadCsv.new(file_name, model)

    expect(model.exists?).to eq true
  end
end
