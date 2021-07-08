FactoryBot.define do
  factory :achievement do
    title { "MyString" }
    description { "MyText" }
    privacy { 1 }
    features { false }
    cover_image { "MyString" }
  end
end
