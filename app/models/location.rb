class Location < ApplicationRecord
  belongs_to :user
  has_many :plants, dependent: :destroy
end
