FactoryBot.define do
  factory :item do
    image {Faker::LoremFlickr.image}
    item_name {Faker::Commerce.product_name}
    explain {Faker::Lorem.paragraph}
    category_id {FactoryBot.build(:category).id }
    situation_id {FactoryBot.build(:situation).id}
    postage_id {FactoryBot.build(:postage).id}
    prefecture_id {FactoryBot.build(:prefecture).id}
    amountday_id {FactoryBot.build(:amountday).id}
    price {Faker::Commerce.price(range: 300..10_000_000)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
