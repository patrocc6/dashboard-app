class Phase < ApplicationRecord
  validates_presence_of :name
  belongs_to :project
end
