class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :dishes_ingredients, through: :dishes
   has_many :ingredients, through: :dishes

   def most_popular_ingredients
      ingredients.group('ingredients.id').order('count(ingredients.id) desc').limit(3)
    end
end