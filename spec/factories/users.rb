FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    familyname_kanji { Faker::Japanese::Name.last_name }
    firstname_kanji { Faker::Japanese::Name.first_name }
    familyname_katakana { Faker::Japanese::Name.last_name }
    firstname_katakana { Faker::Japanese::Name.first_name }
    birthday { Faker::Date.birthday }
  end
end
