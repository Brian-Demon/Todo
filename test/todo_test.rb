# frozen_string_literal: true

require "test_helper"
require "stringio"

class TodoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Todo::VERSION
  end

  def test_add_adds_item
    test_file = StringIO.new
    test_file.write("First", "\n")
    config = {
      database: test_file
    }
    test_manager = Todo::Manager.new(config)
    item = "Second"
    test_manager.add(item)
    test_file.rewind
    results = test_file.read
    expected = "First\nSecond\n"
    assert_equal(expected, results)
  end

  def test_remove_removes_item
    test_file = StringIO.new
    test_file.write("First", "\n")
    test_file.write("Banana", "\n")
    test_file.write("Second", "\n")
    config = {
      database: test_file
    }
    test_manager = Todo::Manager.new(config)
    item = "Banana"
    test_manager.remove(item)
    test_file.rewind
    results = test_file.read
    expected = "First\nSecond\n"
    assert_equal(expected, results)
  end
end #TodoTest
