# Dashboard App

## Key Requirements:
Track project tasks.

## Models:
- Users -> Devise
- Projects -> name:text, description:text, team:Users
- Phases -> title:text, tasks:Tasks, phase_leader:User, status:text, due_date:date
- Tasks -> start_date:date, end_date:date, lead_time:int, due_date:date, status:text,
  team_member:User

## UI:
- Bootstrap
- Icons from font awesome
- Update styles for forms

## Features:
- Create projects with phases and tasks (admin)
- Assign a team to a project (admin)
- Assign team member to tasks
- Team members can update task dates
- Allow only admins to access admin dashboard

## TODO:
- Form validation notifications
