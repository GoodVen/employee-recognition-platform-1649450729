FactoryBot.define do
  factory :employee do
    email { |i| "test#{i}@test.com" }
    password { 'password' }
  end
end
