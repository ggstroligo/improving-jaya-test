class Issue < ApplicationRecord
  has_many :events

  validates :number, presence: true, uniqueness: true
  validates :title, presence: true
end
