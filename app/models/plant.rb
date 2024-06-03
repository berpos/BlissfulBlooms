class Plant < ApplicationRecord
  belongs_to :location
  has_many :logs, dependent: :destroy
end
