FactoryBot.define do
  factory :event do
    action { "opened" }
    association :issue
  end
end