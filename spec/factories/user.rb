FactoryBot.define do
  factory :user do
    name { "testuser1" }
    email {"a@examle.com"}
    password {"password"}
  end
end