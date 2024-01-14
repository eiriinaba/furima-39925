FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'稲葉'}
    first_name            {'えいり'}
    last_name_furigana    {'イナバ'}
    first_name_furigana   {'エイリ'}
    birthday              {'2000/1/1'}
  end
end