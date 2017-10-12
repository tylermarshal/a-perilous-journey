require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require 'pry'


class ListTest < Minitest::Test

  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_test_no_nodes
    list = LinkedList.new

    assert_nil nil, list.head
  end

  def test_one_node
    list = LinkedList.new
    full_list = list.append("West")

    assert_instance_of Node, full_list
    assert_nil nil, list.head.next_node
    assert_equal 1, list.count
    assert_equal "The West family", list.to_string
  end


  def test_one_node_next_node_nil
    list = LinkedList.new
    list.append("Rhodes")

    assert_nil nil, list.head.next_node
  end

  def test_two_nodes
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")

    assert_equal "Rhodes", list.head.surname
    assert_equal "Hardy", list.head.next_node.surname
    assert_equal 2, list.count
    assert_equal "The Rhodes family, followed by the Hardy family", list.to_string
  end

  def test_three_nodes
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")
    list.append("Smith")

    assert_equal 3, list.count
    assert_equal "The Rhodes family, followed by the Hardy family, followed by the Smith family", list.to_string
  end

  def test_it_prepends
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")

    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 3, list.count
  end

  def test_it_inserts
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal 4, list.count
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_it_finds
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The Brooks family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
  end

  def test_it_includes
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert list.includes?("Brooks")
    refute list.includes?("Chapman")
  end

  def test_it_pops
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The Henderson family has died of dysentery", list.pop
    assert_equal "The Brooks family has died of dysentery", list.pop
    assert_equal "The McKinney family, followed by the Lawson family", list.to_string
  end
end
