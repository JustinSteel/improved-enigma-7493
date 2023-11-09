require 'rails_helper'

RSpec.describe 'chef Show Page' do
  describe 'As a visitor' do
    before :each do
    @chef_1 = Chef.create!(name: "Chef Mike")
    @chef_2 = Chef.create!(name: "Chef John")
    @chef_3 = Chef.create!(name: "Chef Bob")

    @dish_1 = Dish.create!(name: "Spaghetti", description: "Spaghetti and Meatballs", chef_id: @chef_1.id)
    @dish_2 = Dish.create!(name: "Pizza", description: "Pepperoni Pizza", chef_id: @chef_1.id)
    @dish_3 = Dish.create!(name: "Burger", description: "Cheeseburger", chef_id: @chef_1.id)

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
    @dish_1.ingredients << @ingredient_6
    @dish_1.ingredients << @ingredient_9
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5
    @dish_2.ingredients << @ingredient_6
    @dish_2.ingredients << @ingredient_9
    @dish_2.ingredients << @ingredient_3
    @dish_3.ingredients << @ingredient_7
    @dish_3.ingredients << @ingredient_8
    @dish_3.ingredients << @ingredient_9
    @dish_3.ingredients << @ingredient_10
    @dish_3.ingredients << @ingredient_6
    @dish_3.ingredients << @ingredient_3
    end

    it 'shows link to view all ingredients used by chef in their dishes' do
      # As a visitor
      # When I visit a chef's show page
      # I see a link to view a list of all ingredients that this chef uses in their dishes.
      # When I click on that link
      # I'm taken to a chef's ingredients index page
      # and I can see a unique list of names of all the ingredients that this chef uses.

      visit chef_path(@chef_1)

      expect(page).to have_link("ingredients for dish")

      click_link "ingredients for dish"
      expect(current_path).to eq(chef_ingredients_path(@chef_1))

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
    end

    it 'shows the three most popular ingredients that the chef uses in their dishes' do
      # As a visitor
      # When I visit a chef's show page
      # I see the three most popular ingredients that the chef uses in their dishes
      # (Popularity is based off of how many dishes use that ingredient)
      visit chef_path(@chef_1)
      save_and_open_page
      expect(page).to have_content("Most Popular Ingredients")
      within("#most-popular-ingredients") do
        expect(page).to have_content(@ingredient_6.name)
        expect(page).to have_content(@ingredient_9.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end
end