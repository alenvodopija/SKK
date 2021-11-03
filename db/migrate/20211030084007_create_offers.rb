class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :transporter_name
      t.string :start_location, null: false
      t.string :end_location, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :number_of_seats
      t.timestamps
    end
  end
end
