class Project < ApplicationRecord
  validates_presence_of :name
  has_many :phases, inverse_of: :project, dependent: :destroy
  has_many :tasks, through: :phases
  accepts_nested_attributes_for :phases, allow_destroy: true,
    reject_if: proc { |attributes| attributes['name'].blank? }
end
