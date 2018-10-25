FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "Song #{n}"}
  end
end
