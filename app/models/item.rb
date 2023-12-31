class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  before_validation :normalize_price

  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :category_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :situation_id, presence: true
  validates :situation_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :postage_id, presence: true
  validates :postage_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, presence: true
  validates :prefecture_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :amountday_id, presence: true
  validates :amountday_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :price, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: "を整数で入力してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :amountday

  def sold_out?
    order.present?
  end

  private

  def normalize_price
    self.price = price.to_s.gsub(/,/,'').to_i
  end
end
