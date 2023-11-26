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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :amountday

  validates :category_id,:situation_id,:postage_id,:prefecture_id,:amountday_id, numericality: { other_than: 1 , message: "can't be blank"}
end