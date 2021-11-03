class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :offer, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.timestamps
    end
  end
end
