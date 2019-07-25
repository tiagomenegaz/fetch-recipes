module Populate
  class Entry
    extend Dry::Initializer

    option :entry

    def call
      @content_type = entry.content_type
      resolve_associated_model
    end

    private

    attr_reader :content_type

    def resolve_associated_model
      call_creator if supported_models.include?(model_name)
    end

    def call_creator
      service.new(fields: entry.fields).()
    end

    def service
      pluralized_model = ActiveSupport::Inflector.pluralize(model_name)
      "#{pluralized_model.capitalize}::Creator".constantize
    end

    def supported_models
      [
        'recipe',
        'tag',
        'chef'
      ]
    end

    def model_name
      content_type.id
    end
  end
end
