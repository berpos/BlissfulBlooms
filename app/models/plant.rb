class Plant < ApplicationRecord
  belongs_to :location
  has_many :logs, dependent: :destroy

  validates :categories, inclusion: { in: ['person', 'moment'] }
  validates :name, :categories, presence: true
  accepts_nested_attributes_for :logs

  before_validation :set_default_state, :set_default_level, on: :create

  def check_state
    plantlog = logs.last.created_at
    days_difference = Time.current - plantlog
    if days_difference >= 3.days
      update(state: "needs caring")
    else
      update(state: "healthy")
    end
  end
  private


  def set_default_state
    self.state ||= 'healthy'
  end

  def set_default_level
    self.level ||= 0
  end
end
