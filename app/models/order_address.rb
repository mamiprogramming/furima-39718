class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :street_number, :building, :telephone, :order, :user_id, :item_id,
                :token, :price

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを入力してください' }
    validates :city
    validates :street_number
    validates :telephone, numericality: { only_integer: true, message: 'は整数で入力してください' },
                          length: { in: 10..11, message: 'は10桁か11桁で入力してください' },
                          format: { with: /\A\d+\z/, message: 'は半角数字で入力してください' }
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :prefecture_id,
            numericality: { other_than: 1, message: "を選択してください" }

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(user_id:, item_id:)
      Address.create(zip:, prefecture_id:, city:, street_number:, building:,
                     telephone:, order_id: order.id)
    end
  end
end
