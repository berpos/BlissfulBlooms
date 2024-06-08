class Location < ApplicationRecord
  belongs_to :user
  has_many :plants, dependent: :destroy
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
