class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :users, through: :appointments

  validates :email, uniqueness: true
  validates_presence_of :name, :password, :password_confirmation,
                        :speciality, :hospital, :age, :experience_level
end
