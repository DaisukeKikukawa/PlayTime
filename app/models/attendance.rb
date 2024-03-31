class Attendance < ApplicationRecord
  belongs_to :user
  validates :date, uniqueness: true
end
