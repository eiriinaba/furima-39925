class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :shipping_fee

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :item_detail, presence: true, length: { maximum: 1000 }
  validates :category_id, :item_status_id, :region_id, :shipping_day_id, :shipping_fee_id, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
