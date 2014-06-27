class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :year
      t.string :color
      t.integer :brand_id
      t.integer :package_id
      t.text :description
      t.integer :publication_type
      t.integer :category_id
      t.decimal :precio_venta
      t.decimal :precio_renta

      t.timestamps
    end
  end
end
