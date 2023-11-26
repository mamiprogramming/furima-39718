class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :category_id,:situation_id,:postage_id,:prefecture_id,:amountday_id, numericality: { other_than: 1 , message: "can't be blank"}
end
