# frozen_string_literal: true

require_relative "todo/version"

module Todo
  class Error < StandardError
  end #Error

  class Manager
    def initialize(config)
      @config = config
    end #initialize

    def database
      @config[:database]
    end #database

    def add(item)
      database.write(item, "\n")
    end #add

    def remove(item)
      puts "\nDatabase: #{database.read}\n\n"
      database.each_line do |line|
        puts "#{database.lineno}: #{line}"
      end
    end #add

  end #Manager
end #Todo
