class ChangeBottomFormatInPackage < ActiveRecord::Migration
  def change
    remove_column :packages, :botton_one, :string
    remove_column :packages, :botton_suscription, :string
    add_column :packages, :botton_one, :text
    add_column :packages, :botton_suscription, :text
  end
end
