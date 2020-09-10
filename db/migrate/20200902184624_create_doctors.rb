class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :hospital
      t.string :age
      t.string :experience_level

      t.timestamps
    end
  end
end
