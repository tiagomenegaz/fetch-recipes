module Populate
  class Content
    extend Dry::Initializer

    def call
      initialize_client
      fetch_data
    end

    private

    attr_reader :client

    def initialize_client
      @client ||= Contentful::Client.new(
        space: ENV.fetch('SPACE_ID'),
        access_token: ENV.fetch('ACCESS_TOKEN')
      )
    end

    def fetch_data
      entries.each do |entry|
        Populate::Entry.new(entry: entry).()
      end
    end

    def entries
      client.entries
    end
  end
end
