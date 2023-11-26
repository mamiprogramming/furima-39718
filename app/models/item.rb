class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :amountday_id, presence: true
  validates :price, presence: true

  belongs_to :category
end