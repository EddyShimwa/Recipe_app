class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipe = Recipe.where(user: @user)
    @ingredients = RecipeFood.where(recipe: @recipe).group_by { |ingredient| ingredient.food.name }
    @total_price = @ingredients.map do |_food, ingredients|
      ingredients.map do |ingredient|
        ingredient.quantity * ingredient.food.price
      end.sum
    end.sum
    
      # Reduce quantity to buy if already present
      @shopping_list.each do |food_name, food|
        own_food = current_user.foods.find_by(name: food_name)
        food[:quantity] -= own_food.quantity if own_food
        food[:value] = food[:quantity] * food[:price]
      end
  
      @food_types = @shopping_list.values.select { |i| (i[:quantity]).positive? }.length
  end
end
