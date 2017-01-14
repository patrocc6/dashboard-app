require 'rails_helper'

RSpec.describe Phase, type: :model do
  describe "creation" do
    before do
      @phase = FactoryGirl.create(:phase)
    end

    it "can be created" do
      expect(@phase).to be_valid
    end

    it "cannot be created without a name" do
      @phase.name = nil
      expect(@phase).not_to be_valid
    end
  end
end
