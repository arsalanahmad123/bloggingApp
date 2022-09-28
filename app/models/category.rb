class Category < ApplicationRecord
    validates :title, presence: true
    has_many :product_categories
    has_many :blogs, through: :product_categories
end
