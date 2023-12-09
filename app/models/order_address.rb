class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :zip, :prefecture_id, :city, :address, :building, :telephone, :order

  with_options presence: true do
    validates :user
    validates :item
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :telephone, numericality: { only_integer: true, message: "should be only half-width numbers" },
                          length: { in: 10..11, message: "should be between 10 and 11 digits" },
                          format: { with: /\A\d+\z/, message: "should contain only half-width numbers" }
    validates :order
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user: user, item: item)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building, order_id: order.id)
  end
end