FactoryBot.define do
  factory :achievement do
    sequence(:title) { |n| "Achievement #{n}"}
    description { "MyText" }
    features { false }
    cover_image { "some_file.png" }
    association  :user

    factory :public_achievement do
      privacy {:public_access}
    end

    factory :private_achievement do
      privacy {:private_access}
    end
  end
end
