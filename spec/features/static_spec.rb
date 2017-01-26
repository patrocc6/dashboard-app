require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end

    it 'hides navbar if not signed in' do
      visit root_path
      expect(page).to_not have_content(/Home/)
    end

    it 'shows nav when user is signed in' do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit root_path
      expect(page).to have_content(/Home/)
    end
  end
end
