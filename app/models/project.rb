class Project < ApplicationRecord
  validates_presence_of :name
  has_many :phases, inverse_of: :project
  has_many :tasks, through: :phases
  accepts_nested_attributes_for :phases, allow_destroy: true, reject_if: :all_blank
end
