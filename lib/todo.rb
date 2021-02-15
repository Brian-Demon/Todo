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

    def remove(item)
      database.each do |line|
        
      end
    end

    def display
      database_contents = []
      database.each do |line|
        database_contents << line.chomp
      end
      database_contents
    end
  end
end
