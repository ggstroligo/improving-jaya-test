class Issue < ApplicationRecord
  # belongs_to :events

  validates :number, presence: true, uniqueness: true
  validates :title, presence: true
end
