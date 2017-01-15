50.times do |project|
  Project.create!(name: "Project #{project}", description: "Description of project #{project}")
end

puts "50 Projects have been created"

4.times do |phase|
  Phase.create(
    name: "Phase #{phase}",
    project_id: Project.first.id
  )
end

puts "4 Phases created on first project"

Phase.all.each do |phase|
  # Add tasks to phases
end

User.create(
  first_name: 'Test',
  last_name: 'User',
  email: 'test@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)
puts "1 User created"

User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@user.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  type: "AdminUser"
)
puts "1 AdminUser created"
