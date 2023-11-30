FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    explain { Faker::Lorem.paragraph }
    category_id {Faker::Number.between(from: 2, to: 11)}
    situation_id {Faker::Number.between(from: 2, to: 7)}
    postage_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    amountday_id {Faker::Number.between(from: 2, to: 4)} 
    price { Faker::Commerce.price(range: 300..10_000_000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
