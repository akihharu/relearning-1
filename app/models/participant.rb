class Participant < ApplicationRecord
  belongs_to :event
  has_many :attendances, dependent: :destroy

  validates :name, presence: true, length: {maximum: 15}
  validates :memo, length: {maximum: 500}
end
