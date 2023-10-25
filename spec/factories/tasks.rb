FactoryBot.define do
  factory :task do
    association :user
    title { FFaker::Book.title }
    description { FFaker::Book.genre }
    due_date { Time.now + 1.days }
  end
end
