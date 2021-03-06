require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "creation" do
    before do
      @project = FactoryGirl.create(:project)
    end

    it "can be created" do
      expect(@project).to be_valid
    end

    it "cannot be created without a name" do
      @project.name = nil
      expect(@project).not_to be_valid
    end
  end
end
