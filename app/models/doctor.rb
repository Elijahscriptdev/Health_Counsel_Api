class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true
  validates_presence_of :hospital, :age, :experience_level, :specialty
end
