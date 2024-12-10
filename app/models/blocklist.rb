class Blocklist < ApplicationRecord
  belongs_to :user
  validates :domain, presence: true, uniqueness: { scope: :user_id }
  validates :app_name, uniqueness: { scope: :user_id }, allow_nil: true
end