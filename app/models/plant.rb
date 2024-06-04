class Plant < ApplicationRecord
  belongs_to :location
  has_many :logs, dependent: :destroy

  validates :name, presence: true
end
