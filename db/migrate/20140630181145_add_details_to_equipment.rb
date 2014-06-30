class AddDetailsToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :modelo, :integer
    add_column :equipment, :moneda_renta, :string
    add_column :equipment, :moneda_venta, :string
    add_column :equipment, :pais, :string
    add_column :equipment, :estado, :string
    add_column :equipment, :ciudad, :string
  end
end
