class RenameColumnInTableName < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :address, :street_number
  end
end
