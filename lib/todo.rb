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

    def get_contents
      database.map(&:chomp)
    end #get_contents

    def add(item)
      database.write(item, "\n")
    end #add

    
  end #Manager
end #Todo
