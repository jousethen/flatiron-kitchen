class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredients=(ingredients)
    ingredients.each do |i|
      if i.strip != ""
        ingredient = Ingredient.find_or_create_by(id: i)
        self.ingredients << ingredient
      end
    end
  end
end
