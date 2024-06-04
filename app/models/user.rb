class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :locations, dependent: :destroy
  has_many :plants, through: :locations

  validates :username, uniqueness: true, presence: true
  validates :garden_name, presence: true
end
