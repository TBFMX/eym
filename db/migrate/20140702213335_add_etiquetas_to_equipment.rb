class AddEtiquetasToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :etiquetas, :string   
  end
end
