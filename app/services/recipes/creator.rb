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
      fields.slice(:title, :description)
    end

    def photo_fields
      url = fields[:photo].url
      url.present? ? { image: url } : {}
    end

    def tags_field
      attributes = if fields.has_key?(:tags)
        fields[:tags].map do |tag|
          tag_instance = Tags::Creator.new(fields: tag.fields).()
          tag_instance.attributes.slice(:id)
        end
      else
        []
      end

      {
        tags_attributes: attributes
      }
    end

    def chef_field
      attributes = if fields.has_key?(:chef)
        chef_instance = Chefs::Creator.new(fields: fields[:chef].fields).()
        chef_instance.attributes.slice(:id)
      else
        {}
      end

      {
        chef_attributes: attributes
      }
    end
  end
end
