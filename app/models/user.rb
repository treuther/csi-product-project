class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_products, through: :reviews, source: :product #creates the relation to Review (belongs_to product)
    has_many :products #that the admin has created

    validates :username, uniqueness: true, presence: true
    
    has_secure_password
end
