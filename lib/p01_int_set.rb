class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @store.length
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_reader :store, :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % num_buckets ] << num
    true
  end

  def remove(num)
    @store[num % num_buckets ].delete(num)
  end

  def include?(num)
     @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
    if !include?(num)
      resize! if count == @store.length
      @store[num % num_buckets ] << num 
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets ].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten.dup
    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0
    old_store.each do |ele| 
      insert(ele)
    end
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end