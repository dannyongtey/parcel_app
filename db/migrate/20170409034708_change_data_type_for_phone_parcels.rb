class ChangeDataTypeForPhoneParcels < ActiveRecord::Migration[5.0]
  def change
    change_column :parcels, :phone, :string
  end
end
