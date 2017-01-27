class Task < ApplicationRecord
  belongs_to :phase
  validates_presence_of :name, :lead_time
  validates :lead_time, :numericality => { :greater_than => 0 }

  attr_reader :due_date, :status

  def due_date
    return nil if self.start_date == nil
    self.start_date + lead_time
  end

  def status
    if self.start_date.nil?
      'not started'
    elsif !self.end_date.nil?
      case
        when self.end_date <= self.due_date
          'completed'
        when self.end_date > self.due_date
          'completed late'
      end
    else
      case
        when self.due_date >= Date.today
          'in progress'
        when self.due_date < Date.today
          'late'
      end
    end
  end

end
