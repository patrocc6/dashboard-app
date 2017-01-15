require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "creation" do
    before do
      @task = FactoryGirl.create(:task)
    end

    it "can be created" do
      expect(@task).to be_valid
    end

    it "cannot be created without a name" do
      @task.name = nil
      expect(@task).not_to be_valid
    end

    it "cannot be created without a lead time" do
      @task.lead_time = nil
      expect(@task).not_to be_valid
    end

    it "cannot be created without referencing a phase" do
      @task.phase_id = nil
      expect(@task).not_to be_valid
    end

    it "has the correct due date" do
      @task.start_date = "2017-01-14"
      @task.lead_time = 3
      expect(@task.due_date).to eq(Date.new(2017, 1, 17))
    end
  end
end
