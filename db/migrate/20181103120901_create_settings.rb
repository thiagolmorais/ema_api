class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.integer :readjust, default: 12
      t.integer :duration, default: 3600

      t.timestamps
    end
  end
end
