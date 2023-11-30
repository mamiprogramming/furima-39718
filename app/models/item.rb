class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :category_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }
  validates :situation_id, presence: true
  validates :situation_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }
  validates :postage_id, presence: true
  validates :postage_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }
  validates :prefecture_id, presence: true
  validates :prefecture_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }
  validates :amountday_id, presence: true
  validates :amountday_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }
  validates :price, presence: true
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is not included in the list' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'must be a number' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :amountday

  validates :category_id, :situation_id, :postage_id, :prefecture_id, :amountday_id,
            numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
end
