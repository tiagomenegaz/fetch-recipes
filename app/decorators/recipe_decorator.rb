class RecipeDecorator < SimpleDelegator
  def image_url
    image
  end
end
