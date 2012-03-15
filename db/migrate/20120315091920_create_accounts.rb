class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :number
      t.string :type
      t.integer :lock_version

      t.timestamps
    end
  end
end
