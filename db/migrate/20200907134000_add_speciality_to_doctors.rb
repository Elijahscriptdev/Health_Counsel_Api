class AddSpecialityToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :speciality, :string
    add_column :doctors, :email, :string
    add_column :doctors, :password_digest, :string
  end
end