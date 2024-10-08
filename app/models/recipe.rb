class Recipe < ApplicationRecord

  paginates_per 5

  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 255}

  belongs_to :chef
  validates :chef_id, presence: true
  default_scope -> {order(updated_at: :desc)}

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :comments, dependent: :destroy
end