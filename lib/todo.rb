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

    def display
      current_data = get_contents
      display = "Current Todo List:"
      current_data.map.with_index do |element, index|
        display += "\n#{index+1}. #{element}"
      end
      display += "\n"
      display
    end

    def item_already_added?(item)
      current_data = get_contents
      !!current_data.index(item)
    end

    def add(item)
      database.write(item, "\n")
    end #add
    
    def remove(item)
      #@TODO: Create remove functionality
    end #remove

  end #Manager
end #Todo
