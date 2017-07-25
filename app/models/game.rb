class Game < ApplicationRecord
  has_many :trackers
  has_many :employees, through: :trackers
end
