FactoryBot.define do
  factory :event, class: "Event" do
    for_issue
    action { "opened" }

    trait :for_issue do
      actionable_type { "Issue" }
      actionable_id { 1 }
    end
  end
end