class Product < ApplicationRecord
  belongs_to :chem_group
  belongs_to :user #admin creator
  has_many :reviews
  has_many :users, through: :reviews #customer who reviews it
end
