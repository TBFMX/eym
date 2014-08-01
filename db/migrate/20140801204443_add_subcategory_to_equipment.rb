class AddSubcategoryToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :subcategory_id, :integer
  end
end
