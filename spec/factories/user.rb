FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'nav12345' }
    password_confirmation { 'nav12345' }
  end
end