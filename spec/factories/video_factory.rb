FactoryBot.define do
  factory :video do
    title { Faker::Dessert.variety }
    category { association(:category) }

    after(:build) do |video|
      video
        .clip
        .attach(
          io: File.open(Rails.root.join('db', 'data', 'Chocolate Macarons Recipe.mp4')),
          filename: 'Chocolate Macarons Recipe.mp4',
          content_type: 'video/mp4'
        )
    end
  end
end
