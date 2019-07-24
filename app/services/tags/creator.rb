module Tags
  class Creator
    extend Dry::Initializer

    option :fields

    def call
      create_tag
    end

    private

    def create_tag
      Tag.find_or_create_by!(fields)
    end
  end
end
