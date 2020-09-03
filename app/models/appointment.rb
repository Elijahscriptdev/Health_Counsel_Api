class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates_presence_of :meeting_info, :date, :time
end
