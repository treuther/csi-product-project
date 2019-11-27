class Epa < ApplicationRecord
    has_many :chem_groups
    has_many :products, through: :chem_groups
end
