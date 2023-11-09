class DishIngredientsController < ApplicationController
  def create
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:ingredient_id])
    dish.ingredients << ingredient
    redirect_to dish_path(dish)
  end

  def destroy
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:id])
    dish.ingredients.delete(ingredient)
    redirect_to dish_path(dish)
end
end
