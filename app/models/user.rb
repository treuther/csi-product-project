class User < ApplicationRecord
    has_many :reviews
    has_many :products, through: :reviews
    has_many :products #that the admin has created
end
