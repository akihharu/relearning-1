class Event < ApplicationRecord
  has_many :candidate_dates, dependent: :destroy
  has_many :participants, dependent: :destroy

  validates :title, presence: true, length: {maximum: 15}
  validates :desc, length: {maximum: 100}
end
