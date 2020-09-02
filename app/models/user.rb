class User < ApplicationRecord
    has_secure_password

    has_many :appointments
    has_many :doctors, through: :appointments
    
    validates_presence_of :name, :email, :password_digest
end
