class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :driver_name
      t.string :country
      t.integer :car_number
      t.string :car_colour
      t.integer :position
      t.integer :interval
      t.boolean :pitting
      t.float :last_lap

      t.timestamps
    end
  end
end
