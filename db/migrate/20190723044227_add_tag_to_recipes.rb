class AddTagToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :tag
  end
end
