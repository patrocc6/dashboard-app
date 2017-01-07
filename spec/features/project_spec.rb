require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit projects_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Projects' do
      visit projects_path
      expect(page).to have_content(/Projects/)
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
