class MaxIntSet
  attr_reader :max
  def initialize(max)
    @max = Array.new(max)
  end
  
  def insert(num)    
    raise "Out of bounds" unless is_valid?(num)
    max[num] = true
  end
  
  def remove(num)
    max[num] = false  if include?(num)
  end
  
  def include?(num)
    max[num]
  end
  
  private
  
  def is_valid?(num)
    return true if num.between?(0, max.length) 
    false
  end
  
  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    self[num] << num
  end
  
  def remove(num)
    self[num].clear
  end
  
  def include?(num)
    return false  if self[num].empty?
    true  
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%20]
  end
  
  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(num)
    
    if count == num_buckets
      resize!
    end
    unless include?(num)
      self[num] << num 
      @count += 1
    end
  end
  
  def remove(num)
    if include?(num) 
      self[num].clear
      @count -= 1
    end
  end
  
  def include?(num)
    return false if self[num].include?(num)
    true
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
    
  end
  
  def num_buckets
    @store.length
  end
  
  def resize!
    new_length = count * 2
    new_array = Array.new(new_length) { Array.new }
    @store.each do |bucket|
      bucket.each do |val|
        new_array[val % new_length] = [val]
      end 
    end
    @store = new_array 
  end
end
