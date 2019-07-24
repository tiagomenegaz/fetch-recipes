class AddColumnToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :chef, foreign_key: true
  end
end
