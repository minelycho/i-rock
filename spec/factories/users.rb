FactoryBot.define do
  require 'faker'


  factory :user do
    # sequence(:email) {|n| 'email#{n}@email.com'}
    email { Faker::Internet.email}
    password {'secretsecret'}
  end
end
