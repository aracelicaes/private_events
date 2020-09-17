class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :date, presence: true
  validates :user_id, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  scope :upcoming_events, -> { where('date >= ?', Date.today) }
  scope :past_events, -> { where('date < ?', Date.today) }
end
