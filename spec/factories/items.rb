FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence[0...40] }
    item_detail { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    
    association :user 

    category_id { Category.where(id: 2..Category.all.last.id).pluck(:id).sample }
    item_status_id { ItemStatus.where(id: 2..ItemStatus.all.last.id).pluck(:id).sample }
    region_id { Region.where(id: 2..Region.all.last.id).pluck(:id).sample }
    shipping_fee_id { ShippingFee.where(id: 2..ShippingFee.all.last.id).pluck(:id).sample }
    shipping_day_id { ShippingDay.where(id: 2..ShippingDay.all.last.id).pluck(:id).sample }

    after(:build) do |message|
      message.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
