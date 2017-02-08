class Phase < ApplicationRecord
  validates_presence_of :name
  belongs_to :project
  acts_as_list scope: :project
  default_scope { order(position: :asc) }
  has_many :tasks, inverse_of: :phase, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank
end
