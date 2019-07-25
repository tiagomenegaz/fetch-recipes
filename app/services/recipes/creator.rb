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
      recipe = Recipe.new(recipe_params)
      recipe.tag_ids = tag_ids
      recipe.save!
    end

    def recipe_params
      base_fields.merge(**photo_fields, **chef_id)
    end

    def base_fields
      fields.slice(:title, :description)
    end

    def photo_fields
      url = fields[:photo].url
      url.present? ? { image: url } : {}
    end

    def tag_ids
      if fields.has_key?(:tags)
        fields[:tags].map do |tag|
          tag_instance = Tags::Creator.new(fields: tag.fields).()
          tag_instance.id
        end
      end
    end

    def chef_id
      if fields.has_key?(:chef)
        chef_instance = Chefs::Creator.new(fields: fields[:chef].fields).()
        { chef_id: chef_instance.id }
      else
        {}
      end
    end
  end
end
