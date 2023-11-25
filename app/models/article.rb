class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :categorygenre_id,:situationgenre_id,:postagegenre_id,:prefecturegenre_id,:amountdaygenre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
