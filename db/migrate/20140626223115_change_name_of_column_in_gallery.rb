class ChangeNameOfColumnInGallery < ActiveRecord::Migration
  def change
  	remove_column :galleries, :equipment
  	add_column :galleries, :equipment_id, :integer
  	add_column :equipment, :image_id, :integer
  end
end
