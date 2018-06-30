class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0 
    self.each_with_index do |el, idx|
      sum += (el ^ idx)
    end 
    sum.hash
  end
end

class String
  def hash
    sum = 0 
    self.each_byte.with_index do |c, idx|
      sum+= (c ^ idx)
    end
    sum.hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0 
    self.keys.each do |key|
      sum += key.to_s.hash
    end 
    sum
  end
end
