FactoryBot.define do
  factory :achievement do
    sequence(:title) { |n| "Achievement #{n}"}
    description { "MyText" }
    privacy { Achievement.privacies[:private_access] }
    features { false }
    cover_image { "some_file.png" }

  factory :public_achievement do 
    privacy {Achievement.privacies[:public_access]}

    end
  end
end
