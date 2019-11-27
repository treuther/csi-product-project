class CreateEpas < ActiveRecord::Migration[6.0]
  def change
    create_table :epas do |t|
      t.integer :chem_number

      t.timestamps
    end
  end
end
