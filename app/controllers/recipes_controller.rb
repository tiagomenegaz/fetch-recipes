class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.includes(:chef, :tags).find_by(id: params[:id])
    redirect_to root_path if @recipe.nil?
  end
end
