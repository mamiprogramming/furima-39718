class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :street_number, :building, :telephone, :order, :user_id, :item_id,
                :token, :price

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street_number
    validates :telephone, numericality: { only_integer: true, message: 'should be only half-width numbers' },
                          length: { in: 10..11, message: 'should be between 10 and 11 digits' },
                          format: { with: /\A\d+\z/, message: 'should contain only half-width numbers' }
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :prefecture_id,
            numericality: { other_than: 1, message: 'should be selected from the options' }

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(user_id:, item_id:)
      Address.create(zip:, prefecture_id:, city:, street_number:, building:,
                     telephone:, order_id: order.id)
    end
  end
end
