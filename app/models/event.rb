class Event < ApplicationRecord
  belongs_to :issue

  validates :action, presence: true
end
