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
      database.rewind
      # puts "\nDatabase: #{database.read}\n\n"
      database.each_line do |line|
        if line.chomp == item
          # puts "MATCH FOUND: #{database.lineno}"
          database.seek(0-line.length*2, IO::SEEK_END)
          database.write("      ")
        end
      end
    end #add

  end #Manager
end #Todo
