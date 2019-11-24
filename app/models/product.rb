class Product < ApplicationRecord
  belongs_to :chem_group
  belongs_to :user #admin creator
  has_many :reviews
  has_many :users, through: :reviews #customer who reviews it
  accepts_nested_attributes_for :chem_group #tells the model to accept chem_group attributes from cg nested form in new product form
  
end
