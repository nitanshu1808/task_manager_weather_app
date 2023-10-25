FactoryBot.define do
  factory :location do
    lat { FFaker::Geolocation.lat }
    lng { FFaker::Geolocation.lng }
    name { FFaker::Address.country }
    association :user
  end
end
