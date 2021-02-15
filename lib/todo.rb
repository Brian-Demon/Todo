# frozen_string_literal: true

require_relative "todo/version"

module Todo
  class Error < StandardError
  end

  class Manager
    def initialize(config)
      @config = config
    end

    def database
      @config[:database]
    end

    def add(item)
      database.write(item, "\n")
    end

    def display
      database.read
    end
  end
end
