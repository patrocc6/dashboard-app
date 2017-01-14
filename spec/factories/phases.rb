FactoryGirl.define do
  factory :phase do
    name "Test phase"
    association :project, factory: :project
  end
end
