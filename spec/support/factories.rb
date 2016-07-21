FactoryGirl.define do
  factory :merchant do
    name "A Great Merchant"
  end

  factory :customer do
    first_name "Erin"
    last_name "G"
  end

  factory :item do
    name "thingy"
    description "a great thingy"
    unit_price "1234"
    merchant
  end

  factory :invoice do
    status "shipped"

    customer
    merchant
  end

  factory :invoice_item do
    quantity 1
    unit_price "100"
    invoice
    item
  end

  factory :transaction do
    credit_card_number "12345"
    result "succes"
    invoice
  end

end
