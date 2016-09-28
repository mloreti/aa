class DropHousesTable < ActiveRecord::Migration
  def up
    drop_table :houses_tables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
