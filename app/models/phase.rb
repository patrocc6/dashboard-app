class Phase < ApplicationRecord
  validates_presence_of :name
  belongs_to :project
  has_many :tasks, inverse_of: :phase, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank
end
