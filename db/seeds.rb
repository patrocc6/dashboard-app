50.times do |project|
  Project.create!(name: "Project #{project}", description: "Description of project #{project}")
end

puts "50 Projects have been created"
