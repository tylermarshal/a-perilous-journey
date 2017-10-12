require 'minitest/autorun'
require 'minitest/pride'
require "./lib/wagon_train"
require 'pry'


class TestWagonTrain < Minitest::Test

  def test_it_exists_no_nodes
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
    assert_instance_of LinkedList, wt.list
    assert_nil nil, wt.list.head
  end

  def test_it_appends_one_node
    wt = WagonTrain.new

    assert_instance_of Node, wt.append("Burke")
    assert_equal "Burke", wt.list.head.surname
  end

  def test_it_appends_two_nodes
    wt = WagonTrain.new
    wt.append("Burke")

    assert_instance_of Node, wt.append("West")
    assert_equal 2, wt.count
  end

  def test_it_appends_supplies
    wt = WagonTrain.new

    assert_instance_of Node, wt.append("Burke", {"pounds of food" => 200})
    assert_instance_of Node, wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    assert_instance_of Node, wt.list.insert(1, "West", {"pounds of food" => 300})
    assert_equal "Hardy", wt.list.head.surname
    assert_equal 3, wt.count
    assert_equal ({"spare wagon tongues" => 3, "pounds of food" => 500}), wt.supplies
  end

  def test_it_can_hunt
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 0})
    wt.go_hunting

    #difficult to test a randomized method, so just tested that the number changed
    #as long as the number of animals shot is not zero
    refute_equal ({"pounds of food" => 0}), wt.supplies
  end
end
