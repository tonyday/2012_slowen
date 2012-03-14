class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file_name
      t.text :contents
      t.integer :user_id

      t.timestamps
    end
  end
end
