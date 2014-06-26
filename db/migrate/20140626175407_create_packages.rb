class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
