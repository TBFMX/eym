class AddBottonsToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :botton_one, :string
    add_column :packages, :botton_suscription, :string
    add_column :equipment, :pagado, :string
    add_column :users, :package_id, :integer	
  end
end
