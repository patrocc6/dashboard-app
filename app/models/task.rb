class Task < ApplicationRecord
  belongs_to :phase
  validates_presence_of :name, :lead_time

  attr_reader :due_date

  def due_date
    self.start_date + lead_time
  end
end
