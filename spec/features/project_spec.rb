require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:admin_user)
    login_as(@user, :scope => :user)
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
      project1 = FactoryGirl.create(:project)
      project2 = FactoryGirl.create(:second_project)
      visit projects_path
      expect(page).to have_content(/Project 1|Project 2/)
    end
  end

  describe 'new' do
    it 'has a link from the projects page' do
      visit projects_path
      click_button('new_project')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @project = FactoryGirl.create(:project)
      visit projects_path
      click_link("delete_project_#{@project.id}")
      expect(Project.all.count).to eq(0)
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

      expect(page).to have_content("New Project")
    end
  end

  describe 'edit' do
    before do
      @project = FactoryGirl.create(:project)
    end

    it 'can be reached from edit link on index' do
      visit projects_path
      click_link "edit_#{@project.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_project_path(@project)

      fill_in 'project[name]', with: "New Project"
      fill_in 'project[description]', with: "Edited description"
      click_on "Save"

      expect(find_field('project[description]').value).to have_content('Edited description')
    end

    it 'cannot be edited by a regular user' do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit edit_project_path(@project)
      expect(current_path).to eq(root_path)
    end
  end
end
