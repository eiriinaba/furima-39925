FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    region_id { 2 }
    city { '刈谷市' }
    house_number { '507' }
    building { '東京ハイツ' }
    phone_number { '08051609456' }
    transient do
      token { "tok_exampletoken123" }
    end

    after(:build) do |order_address, evaluator|
      order_address.token = evaluator.token
    end
  end
end
