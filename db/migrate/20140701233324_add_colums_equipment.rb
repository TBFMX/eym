class AddColumsEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :estado, :string
    add_column :equipment, :ciudad, :string
  end
end
