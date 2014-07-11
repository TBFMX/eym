class ChangeNameToCountry < ActiveRecord::Migration
  def change
  	rename_column :states, :country, :country_id
  end
end
