FactoryBot.define do
  factory :admin do
    email { |i| "admin#{i}@test.com" }
    password { 'password' }
  end
end
