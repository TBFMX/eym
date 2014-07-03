class ChangeEquipmentParamsToRelation < ActiveRecord::Migration
  def change
    remove_column :equipment, :country_id, :string
    remove_column :equipment, :state_id, :string
    remove_column :equipment, :currency_id, :string    
    add_column :equipment, :currency_id, :string  
    add_column :equipment, :country_id, :string
    add_column :equipment, :state_id, :string  	  	
  end
end
