class Log < ApplicationRecord
  belongs_to :plant
  after_create :level_up

  validates :content, presence: true
  validates :categories, inclusion: { in: %i[water trim soil] }

  def level_up
    log_count = plant.logs.count

    if (log_count >= 0) && (log_count <= 3)
      plant.update(level: 0)
    elsif (log_count >= 4) && (log_count <= 7)
      plant.update(level: 1)
    elsif (log_count >= 8) && (log_count <= 11)
      plant.update(level: 2)
    else
      plant.update(level: 3)
    end
  end
end
