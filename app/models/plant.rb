class Plant < ApplicationRecord
  belongs_to :location
  has_many :logs, dependent: :destroy

  validates :categories, inclusion: { in: ['person', 'moment'] }
  validates :name, :categories, presence: true
  accepts_nested_attributes_for :logs

  before_validation :set_default_state, :set_default_level, on: :create

  private

  def set_default_state
    self.state ||= 'healthy'
  end

  def set_default_level
    self.level ||= 0
  end
  
end
