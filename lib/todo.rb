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

    def contents
      @contents ||= get_contents
    end #contents

    def get_contents
      database.map(&:chomp)
    end #get_contents

    def is_empty?
      contents.empty?
    end

    def display
      current_data = contents
      display = "Current Todo List:"
      current_data.map.with_index do |element, index|
        display += "\n#{index+1}. #{element}"
      end
      display += "\n"
      display
    end #display

    def item_already_added?(item)
      current_data = get_contents.map(&:downcase)
      !!current_data.index(item.downcase)
    end #item_already_added?

    def add(item)
      database.write(item, "\n")
    end #add
    
    def remove(item)
      #@TODO: Create remove functionality
    end #remove

    def clear
      database.truncate(0)
    end #clear

    def valid_removal?(response)
      (1..contents.length).member?(response.to_i)
    end #valid_removal?

  end #Manager
end #Todo
