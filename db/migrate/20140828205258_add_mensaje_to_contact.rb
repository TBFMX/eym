class AddMensajeToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :mensaje, :string  	
  end
end
