class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, length: { in: 4..12 }, uniqueness: true

  has_many :events
  
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
end
