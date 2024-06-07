class Plant < ApplicationRecord
  belongs_to :location
  has_many :logs, dependent: :destroy

  validates :categories, inclusion: { in: ['person', 'moment'] }
  validates :name, :categories, presence: true
  accepts_nested_attributes_for :logs
end
