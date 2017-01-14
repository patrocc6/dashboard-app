require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)

    @project = FactoryGirl.create(:project)
    @phase = FactoryGirl.create(:phase)
  end

  describe 'add/remove' do
    before do
      
    end

    xit 'can be added to a project' do

    end

    xit 'can be removed from a project' do

    end
  end

end
