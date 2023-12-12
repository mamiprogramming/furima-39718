FactoryBot.define do
  factory :order_address do
    zip { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street_number { '1-1' }
    building { '東京ハイツ' }
    telephone { '09012345678' }
  end
end