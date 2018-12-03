class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.time :start_time
      t.time :end_time
      t.boolean :status, default: false
      t.float :price
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
