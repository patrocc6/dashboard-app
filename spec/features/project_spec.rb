require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf",
      password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit projects_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Projects' do
      expect(page).to have_content(/Projects/)
    end

    it 'has a list of projects' do
      project1 = Project.create(name: "Project 1", description: "test description")
      project2 = Project.create(name: "Project 2", description: "test description")
      visit projects_path
      expect(page).to have_content(/Project 1|Project 2/)
    end
  end

  describe 'creation' do
    before do
      visit new_project_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'project[name]', with: "New Project"
      fill_in 'project[description]', with: "New project description"

      click_on "Save"

      expect(page).to have_content("New project description")
    end
  end
end
