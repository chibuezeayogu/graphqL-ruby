FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "User #{i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
    password_digest { "123456" }
  end
end
