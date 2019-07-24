module Chefs
  class Creator
    extend Dry::Initializer

    option :fields

    def call
      create_chef
    end

    private

    def create_chef
      Chef.find_or_create_by!(fields)
    end
  end
end
