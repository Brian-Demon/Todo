# frozen_string_literal: true

require "test_helper"
require "stringio"

class TodoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Todo::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_add_adds_item
    test_file = StringIO.new("First", "a+")
    config = {
      database: test_file
    }
    test_manager = Todo::Manager.new(config)
    item = "Second"
    test_manager.add(item)
    results = test_file.rewind
    expected = "First\nSecond\n"
    assert_equal(expected, results)
  end
end
