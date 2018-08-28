class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.decimal :price
      t.date :readjust
      t.integer :customer_id
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
