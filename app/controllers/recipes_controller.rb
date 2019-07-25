class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    @decorated_recipe = ::RecipeDecorator.new(recipe)
  end
end
