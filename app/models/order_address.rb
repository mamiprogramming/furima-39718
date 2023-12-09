class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :zip, :prefecture_id, :city, :address, :building, :telephone, :buy
end