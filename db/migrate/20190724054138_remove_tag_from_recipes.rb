class RemoveTagFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :recipes, :tag
  end
end
