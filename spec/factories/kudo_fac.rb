FactoryBot.define do
  factory :kudo do
    title { 'some message' }
    content { 'Cfdfent' }
    giver { create(:employee) }
    receiver { create(:employee) }
  end
end
