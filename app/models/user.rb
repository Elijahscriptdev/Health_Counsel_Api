class User < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :doctors, through: :appointments

  validates :email, uniqueness: true
  validates_presence_of :name, :password_digest
end
