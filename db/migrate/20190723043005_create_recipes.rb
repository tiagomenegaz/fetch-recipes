class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.string :description, null: false
      t.string :chef_name, null: false

      t.timestamps
    end
  end
end
