class RemoveInStockFromChemGroup < ActiveRecord::Migration[6.0]
  def change
    remove_column :chem_groups, :in_stock, :boolean
  end
end
