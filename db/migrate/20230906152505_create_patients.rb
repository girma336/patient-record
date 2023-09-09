class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
