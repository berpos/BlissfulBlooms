class Log < ApplicationRecord
  belongs_to :plant

  validates :logs, presence: true
end
