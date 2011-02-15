=begin
  * Реализовать uniq и uniq! для массивов.
=end

class Array
  def uniq
    a=[]
    self.each { |item| a << item unless a.include?(item)}
    return a
  end

def uniq!
    a=[]
    self.each_with_index {|item, index| a.include?(item) ? self[index] = nil : a << item}.compact!
  end
end

# Tests
a = [1, 2, 3, 2, 1, 6, 9, [1, 1, 2, 2, 3], 0, 2, [1, 1, 2, 2, 3], 9, 4]
puts "Original a   : #{a.inspect}"
puts "a.uniq       : #{a.uniq.inspect}"
puts "a after uniq : #{a.inspect}"
puts "a.uniq!      : #{a.uniq!.inspect}"
puts "a after uniq : #{a.inspect}"

