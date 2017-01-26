require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end

    it 'hides navbar if not signed in' do
      logout(:user)
      visit root_path
      expect(page).to_not have_content(/Home/)
    end

    it 'shows nav when user is signed in' do
      visit root_path
      expect(page).to have_content(/Home/)
    end

    it 'hides admin dashboard link for regular users' do
      visit root_path
      expect(page).to_not have_content(/Admin Dashboard/)
    end
  end
end
