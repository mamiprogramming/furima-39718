class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :zip, :prefecture_id, :city, :street_number, :building, :telephone, :order, :user_id, :item_id

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :street_number
    validates :telephone, numericality: { only_integer: true, message: "should be only half-width numbers" },
                          length: { in: 10..11, message: "should be between 10 and 11 digits" },
                          format: { with: /\A\d+\z/, message: "should contain only half-width numbers" }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }


  def save
    ActiveRecord::Base.transaction do
      order_address = Order.create(user_id: user_id, item_id: item_id)
      Address.create(zip: zip, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, telephone: telephone, order_id: order_address.id)
    end
  end
end