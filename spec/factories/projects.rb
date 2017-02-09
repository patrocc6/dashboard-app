FactoryGirl.define do
  factory :project do
    name "Project 1"
    description "Description for project 1."
  end

  factory :second_project, class: "Project" do
    name "Project 2"
    description "This is a project description."
  end
end

FactoryGirl.define do
  factory :project_with_phase, :parent => :project do |project|
    phases { build_list :phase, 1 }
  end
end
