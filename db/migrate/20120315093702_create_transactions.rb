class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :amount
      t.string :payee
      t.string :fit_id
      t.integer :account_id
      t.integer :lock_version

      t.timestamps
    end
  end
end
