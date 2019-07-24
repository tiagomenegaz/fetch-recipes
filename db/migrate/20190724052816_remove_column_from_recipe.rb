class RemoveColumnFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :chef_name, :string
  end
end
