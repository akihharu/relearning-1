class Attendance < ApplicationRecord
  belongs_to :participant
  belongs_to :candidate_date
end
