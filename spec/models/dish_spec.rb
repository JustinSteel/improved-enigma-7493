require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
  end

  describe "instance methods" do
    before :each do
      @chef_1 = Chef.create!(name: "Chef Mike")
      @chef_2 = Chef.create!(name: "Chef John")
      @chef_3 = Chef.create!(name: "Chef Bob")
  
      @dish_1 = Dish.create!(name: "Spaghetti", description: "Spaghetti and Meatballs", chef_id: @chef_1.id)
      @dish_2 = Dish.create!(name: "Pizza", description: "Pepperoni Pizza", chef_id: @chef_2.id)
      @dish_3 = Dish.create!(name: "Burger", description: "Cheeseburger", chef_id: @chef_3.id)
  
      @ingredient_1 = Ingredient.create!(name: "Spaghetti Noodles", calories: 200)
      @ingredient_2 = Ingredient.create!(name: "Marinara Sauce", calories: 100)
      @ingredient_3 = Ingredient.create!(name: "Meatballs", calories: 150)
      @ingredient_4 = Ingredient.create!(name: "Pizza Dough", calories: 300)
      @ingredient_5 = Ingredient.create!(name: "Pepperoni", calories: 200)
      @ingredient_6 = Ingredient.create!(name: "Cheese", calories: 200)
      @ingredient_7 = Ingredient.create!(name: "Bun", calories: 150)
      @ingredient_8 = Ingredient.create!(name: "Beef Patty", calories: 250)
      @ingredient_9 = Ingredient.create!(name: "Ketchup", calories: 100)
      @ingredient_10 = Ingredient.create!(name: "Mustard", calories: 50)
  
      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_4
      @dish_2.ingredients << @ingredient_5
      @dish_2.ingredients << @ingredient_6
      @dish_3.ingredients << @ingredient_7
      @dish_3.ingredients << @ingredient_8
      @dish_3.ingredients << @ingredient_9
      @dish_3.ingredients << @ingredient_10
      end
    it "#total_calories" do
    expect(@dish_1.total_calories).to eq(450)
    end
  end

end