class FixRemarksName < ActiveRecord::Migration[5.0]
  def change
    rename_column :parcels, :remakrs, :remarks
  end
end
