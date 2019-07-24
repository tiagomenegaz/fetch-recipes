class CreateJoinTableTagsRecipes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :recipes do |t|
      t.index [:tag_id, :recipe_id], unique: true
    end
  end
end
