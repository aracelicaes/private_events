class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, length: { in: 4..12 }, uniqueness: true
end
