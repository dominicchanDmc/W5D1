class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    ahash =0 
   return 1 if self.empty?
    each_with_index do |ele,i|
      ahash += ele.hash ** (1 / (i + 1))
    end 
    ahash
  end
end

class String
  def hash
    ahash =0 
   return 1 if self == ''
    each_char.with_index do |ele,i|
      ahash += ele.hash ** (1 / (i + 1))
    end 
    ahash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end