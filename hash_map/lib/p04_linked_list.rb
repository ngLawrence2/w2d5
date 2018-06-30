class Node
  attr_accessor :key, :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  
  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  
  def initialize
    @head = Node.new 
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head 
  end
  
  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end
  
  def first
    @head.next
  end
  
  def last
    @tail.prev
  end
  
  def empty?
    @head.next == @tail && @tail.prev == @head 
  end
  
  def get(key)
    node = @head.next 
    while node != @tail.prev 
      return node.val if node.key == key 
      node = node.next  
    end
    return node.val if node.key == key  
    nil
  end
  
  def include?(key)
    return true unless get(key).nil?
    false
  end
  
  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node 
    @tail.prev = node 
  end
  
  def update(key, val)
    return if empty?
  
    node = @head
    while node != @tail 
      if node.key == key 
        node.val = val 
        break
      end
      node = node.next  
    end
    # node.val = val if node.key == key  
  end
  
  def remove(key)
    print @head.next
  end
  
  def each
  
  end
  
  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
