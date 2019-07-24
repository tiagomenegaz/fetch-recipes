module Recipes
  class Creator
    extend Dry::Initializer

    option :fields

    def call
      ActiveRecord::Base.transaction do
        save_recipe
      end
    end

    private

    def save_recipe
      Recipe.create!(recipe_params)
    end

    def recipe_params
      base_fields.merge(**photo_fields, **tags_field, **chef_field)
    end

    def base_fields
      fields.slice(:title, :calories, :description)
    end

    def photo_fields

    end

    def tags_field

    end

    def chef_field

    end
  end
end
