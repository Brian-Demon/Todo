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

  def test_get_contents
    test_file = StringIO.new()
    test_file.write("Stuff", "\n")
    test_file.write("More Stuff", "\n")
    config = {
      database: test_file
    }
    test_manager = Todo::Manager.new(config)
    test_file.rewind
    results = test_manager.get_contents
    expected = ["Stuff", "More Stuff"]
    assert_equal(expected, results)
  end

  def test_display
    test_file = StringIO.new()
    test_file.write("Go to bank", "\n")
    test_file.write("Get flowers for spouse", "\n")
    test_file.write("Take over the world", "\n")
    config = {
      database: test_file
    }
    test_manager = Todo::Manager.new(config)
    test_file.rewind
    results = test_manager.display
    expected = "Current Todo List:"
    expected += "\n1. Go to bank"
    expected += "\n2. Get flowers for spouse"
    expected += "\n3. Take over the world"
    expected += "\n"
    assert_equal(expected, results)
  end
end #TodoTest
