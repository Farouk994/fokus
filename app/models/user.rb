class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password

  has_many :blocklists, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 2, maximum: 15 }
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  validates_format_of :email, presence: true,
                              with: /@/,
                              uniqueness: { case_sensitive: false },
                              length: { minimum: 5, maximum: 15},
                              format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { maximum: 105 }

  def create_predefined_schedules
    time_zone = self.time_zone || "UTC"
    predefined_schedules = [
      { start_time: "09:00", end_time: "5:00", days: "Monday,Tuesday,Wednesday,Thursday,Friday" },
      { start_time: "22:30", end_time: "6:00", days: "Monday,Tuesday,Wednesday,Thursday,Friday" }
    ]

    predefined_schedules.map do |schedule|
      self.schedules.create!(
        start_time: schedule[:start_time],
        end_time: schedule[:end_time],
        days: schedule[:days]
      )
    end
  end
end
