class CreateChemGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :chem_groups do |t|
      t.string :name
      t.boolean :in_stock

      t.timestamps
    end
  end
end
