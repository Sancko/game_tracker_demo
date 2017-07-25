class Employee < ApplicationRecord
  has_many :trackers
  has_many :games, through: :trackers

  def self.by_speciality
    self.select(:id, :name, :speciality).group_by(&:speciality)
  end
end
