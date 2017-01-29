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

    it "cannot be created with a negative lead time" do
      @task.lead_time = -10
      expect(@task).not_to be_valid
    end

    it "cannot be created with a lead time of 0" do
      @task.lead_time = 0
      expect(@task).not_to be_valid
    end
  end

  describe "status" do
    before do
      @task = FactoryGirl.create(:task)
    end

    it "shows not started" do
      @task.start_date = nil
      expect(@task.status).to eq("not started")
    end

    it "shows in progress" do
      @task.start_date = "2017-1-1"
      @task.lead_time = 99999
      @task.end_date = nil
      expect(@task.status).to eq("in progress")
    end

    it "shows late" do
      @task.start_date = "2017-1-1"
      @task.lead_time = 1
      @task.end_date = nil
      expect(@task.status).to eq("late")
    end

    it "shows completed late" do
      @task.start_date = "2017-1-1"
      @task.lead_time = 1
      @task.end_date = "2017-1-3"
      expect(@task.status).to eq("completed late")
    end

    it "shows completed on time" do
      @task.start_date = "2017-1-1"
      @task.lead_time = 10
      @task.end_date = "2017-1-3"
      expect(@task.status).to eq("completed")
    end
  end
end
