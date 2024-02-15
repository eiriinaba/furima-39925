class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :post_code, :city, :house_number, :phone_number, :token
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :house_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Must be 10 or 11 digits"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, house_number: house_number, building: building, phone_number: phone_number,order_id: order.id)
  end
end