class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.integer :quantity
      t.integer :phone
      t.string :courier
      t.string :remakrs

      t.timestamps
    end
  end
end
