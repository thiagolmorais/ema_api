class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :status
      t.float :price
      t.integer :custumer_id
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
