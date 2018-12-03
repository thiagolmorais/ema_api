class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :value
      t.string :competence
      t.date :due_date
      t.date :payment
      t.boolean :status, default: false
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
