class ChangeAccountTypeColumn < ActiveRecord::Migration

  def up
    rename_column :accounts, :type, :ofx_type
  end

  def down
  end

end
