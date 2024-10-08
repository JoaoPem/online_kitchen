class Ingredient < ApplicationRecord

  paginates_per 5

  validates :name, presence: true, length: {minimun: 3, maximum: 25}
  validates_uniqueness_of :name
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

end