class ChangeEquipmentParamsToRelation < ActiveRecord::Migration
  def change
    remove_column :equipment, :pais, :string
    remove_column :equipment, :estado, :string
    remove_column :equipment, :moneda, :string    
    add_column :equipment, :currency_id, :string  
    add_column :equipment, :country_id, :string
    add_column :equipment, :state_id, :string  	  	
  end
end
