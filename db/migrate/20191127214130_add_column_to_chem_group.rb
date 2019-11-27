class AddColumnToChemGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :chem_groups, :epa_id, :integer
  end
end
