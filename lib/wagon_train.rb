require "./lib/list"

class WagonTrain

attr_accessor :list

  def initialize
    @list = LinkedList.new
    # @head = LinkedList.new.head
  end

  def append(name, supplies = nil)
    @list.append(name, supplies)
  end

  def count
    @list.count
  end

  def supplies
    @list.supplies
  end

  def go_hunting
    @list.go_hunting
  end



end
