require 'byebug'
class HashSet
  attr_reader :count
  
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(key)
    if count == num_buckets
      resize!
    end
    unless include?(key)
      self[key] << key 
      @count += 1
    end
  end
  
  def include?(key)
    # debugger
    return false unless self[key].include?(key)
    true
  end
  
  def remove(key)
    if include?(key) 
      self[key].delete(key)
      @count -= 1
    end
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    hash_num = num.hash % num_buckets
    # p "num#{num}"
    # p "#{hash_num}hash"
    @store[hash_num]
  end
  
  def num_buckets
    @store.length
  end
  
  def resize!
    new_length = count * 2
    new_array = Array.new(new_length) { Array.new }
    @store.each do |bucket|
      bucket.each do |val|
        new_array[val.hash % new_length] = val
      end 
    end
    @store = new_array 
  end
end
