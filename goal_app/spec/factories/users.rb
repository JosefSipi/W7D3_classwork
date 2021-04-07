FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    password { 'password' }

  end
end