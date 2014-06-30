class RemoveColumnsToEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :moneda_renta, :string
    remove_column :equipment, :moneda_venta, :string
	remove_column :equipment, :precio_venta, :decimal
	remove_column :equipment, :precio_renta, :decimal    
    add_column :equipment, :precio, :decimal    	  
    add_column :equipment, :moneda, :string     	
  end
end
