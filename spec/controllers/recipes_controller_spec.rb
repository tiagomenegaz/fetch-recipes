require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      recipe = Recipe.create!(title: "title", image: "image", description: "description")
      get :show, id: recipe.id
      expect(response).to have_http_status(:success)
    end
  end
end
