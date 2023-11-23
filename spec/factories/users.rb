FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familyname_kanji {Faker::Name.last_name}
    firstname_kanji {Faker::Name.first_name}
    familyname_katakana {Faker::Name.last_name}
    firstname_katakana {Faker::Name.first_name}
    birthday {Faker::Date.birthday}
  end
end
