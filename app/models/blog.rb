class Blog < ApplicationRecord
     is_impressionable
     acts_as_votable
    belongs_to :user
    validates :heading, presence: true
    validates :description, presence: true
    has_many  :product_categories
    has_many :categories, through: :product_categories
    has_many :comments
    has_many :likes
end
