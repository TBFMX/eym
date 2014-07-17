class AddColumnsForV2AndPaypal < ActiveRecord::Migration
  def change
  	add_column :users, :active, :integer
  	add_column :equipment, :status, :integer
  end
end
