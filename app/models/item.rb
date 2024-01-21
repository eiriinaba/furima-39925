class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :shipping_fee

  belongs_to :user
  has_one_attached :image

  validates :name, :item_detail, presence: true
  validates :user, presence: true
  validates :category_id, :item_status_id, :region_id, :shipping_day_id, :shipping_fee_id, numericality: { other_than: 1 } 
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
