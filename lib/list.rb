require './lib/node'

class LinkedList

  attr_reader :head

  def initialize
    @head = nil
    @pounds_food = 0
  end

  def append(name, supplies = nil)
    if @head.nil?
      @head = Node.new(name, supplies)
    else
      current_node = append_find_end_of_list
      current_node.next_node = Node.new(name, supplies)
    end
  end

  def append_find_end_of_list
    current_node = @head
    until current_node.next_node.nil?
     current_node = current_node.next_node
    end
    current_node
  end

  def prepend(name, supplies = nil)
    if @head.nil?
      @head = Node.new(name, supplies)
    else
      prepend_node = Node.new(name, supplies)
      prepend_node.next_node = @head
      @head = prepend_node
    end
  end

  def insert(position, name, supplies = nil)
    if @head.nil?
      @head = Node.new(name, supplies)
    else
      current_node = find_position_to_insert(position)
      pushed_nodes = current_node.next_node
      current_node.next_node = Node.new(name, supplies)
      current_node.next_node.next_node = pushed_nodes
    end
  end

  def find_position_to_insert(position)
    counter = 0
    current_node = @head
    until (counter + 1) == position
      current_node = current_node.next_node
      counter += 1
    end
    current_node
  end

  def count
    counter = 0
    current = @head
    until current.nil?
      current = current.next_node
      counter += 1
    end
    counter
  end

  def to_string
    current = @head
    families = "The #{current.surname} family"
    until current.next_node.nil?
      current = current.next_node
      families << ", followed by the #{current.surname} family"
    end
    families
  end

  def find(position, amount_families)
    current_node = find_current_node_counter(position)
    families = "The #{current_node.surname} family"
    families_counter = 1
    until families_counter == amount_families
      current_node = current_node.next_node
      families << ", followed by the #{current_node.surname} family"
      families_counter += 1
    end
    families
  end

  def find_current_node_counter(position)
    counter = 0
    current_node = @head
    until counter == position
      current_node = current_node.next_node
      counter += 1
    end
    current_node
  end

  def includes?(name)
    current_node = @head
      until current_node == nil
        return true if current_node.surname == name
        current_node = current_node.next_node
      end
      false
  end

  def pop
    if @head.nil?
      puts "There are no families on this journey."
    else
      popped_node = find_node_to_pop
      "The #{popped_node.surname} family has died of dysentery"
    end
  end

  def find_node_to_pop
    current_node = @head
    until current_node.next_node.next_node.nil?
     current_node = current_node.next_node
    end
    popped_node = current_node.next_node
    current_node.next_node = nil
    popped_node
  end

  def supplies
    current_node = @head
    supplies_list = {}
    until current_node.nil?
      if supplies_list.has_key?(current_node.supplies.keys[0])
        supplies_list[current_node.supplies.keys[0]] += current_node.supplies.values[0]
      else
        supplies_list.merge!(current_node.supplies)
      end
      current_node = current_node.next_node
    end
    supplies_list["pounds of food"] += @pounds_food if supplies_list.has_key?("pounds of food")
    supplies_list
  end

  def go_hunting
    animals = {"squirrel"=>2, "deer"=>40, "bison"=>100}
    hunted_animals = {"squirrel"=>0, "deer"=>0, "bison"=>0}
    rand(0..5).times do |animal|
        hunted_animals[animals.keys[rand(0..2)]] += 1
    end
    if hunted_animals["squirrel"] > 1
      squirrel_plural = "squirrels"
    else
      squirrel_plural = "squirrel"
    end
    @pounds_food = ((hunted_animals["deer"]) * 40) + ((hunted_animals["squirrel"]) * 2) + ((hunted_animals["bison"]) * 100)
    "You got #{hunted_animals["squirrel"]} #{squirrel_plural}, #{hunted_animals["deer"]} deer and #{hunted_animals["bison"]} bison for #{@pounds_food} pounds of food"
  end
end
