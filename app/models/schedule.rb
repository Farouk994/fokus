class Schedule < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :days, presence: true
end
