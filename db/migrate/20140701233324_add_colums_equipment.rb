class AddColumsEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :rank, :integer
    add_column :equipment, :priority, :integer
  end
end
