class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.integer :equipment
      t.integer :user_id

      t.timestamps
    end
  end
end
