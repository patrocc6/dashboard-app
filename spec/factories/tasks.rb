FactoryGirl.define do
  factory :task do
    name "Test Task"
    start_date "2017-01-14"
    end_date "2017-01-14"
    lead_time 3
    association :phase, factory: :phase
  end
end
