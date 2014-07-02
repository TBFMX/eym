class ChangeModelInterToString < ActiveRecord::Migration
  def change
  	remove_column :equipment, :modelo, :integer    
    add_column :equipment, :modelo, :string   
  end
end
