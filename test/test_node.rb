require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"

class Test_entry_node < Minitest::Test

  def test_it_exists
    node = Node.new("Burke")

    assert_instance_of Node, node
  end

  def test_it_has_attributes
    node = Node.new("Burke")

    assert_equal "Burke", node.surname
    assert_equal nil, node.next_node
  end
end
