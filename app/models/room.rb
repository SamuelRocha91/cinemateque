class Room < ApplicationRecord
  belongs_to :movie_theater
  validates :name, :capacity, presence: true
  validates :capacity, numericality: { greater_than: 0 }
  has_many :sessions
end
